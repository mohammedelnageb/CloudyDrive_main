import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: weatherWidget
    property bool celsius: true

    // Temperature properties in Fahrenheit
    property int currentTempF: 72
    property int highTempF: 75
    property int lowTempF: 64

    color: "#151515"
    Layout.preferredWidth: 270
    Layout.preferredHeight: 415
    radius: 15

    function fahrenheitToCelsius(fahrenheit) {
        return ((fahrenheit - 32) * 5 / 9).toFixed(2);
    }

    ColumnLayout {
        width: parent.width * 0.8
        anchors.centerIn: parent
        spacing: 18

        // Title
        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: qsTr("Weather")
            font.pixelSize: 20
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#888888"  // replaced alphaColor with fixed lighter color
        }

        // Weather icon
        Image {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            source: "qrc:/assets/icons/Cloud Icon.svg"
            width: 100
            height: 100
            fillMode: Image.PreserveAspectFit
        }

        // Weather description and temperatures
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 10

            // Description
            Text {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("Partly Cloudy")
                font.pixelSize: 20
                font.weight: Font.Light
                font.family: "Lato"
                color: "#FFFFFF"
            }

            // Current temperature
            Text {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("%0 °%1")
                    .arg(celsius ? fahrenheitToCelsius(currentTempF) : currentTempF)
                    .arg(celsius ? "C" : "F")
                font.pixelSize: 48
                font.weight: Font.Bold
                font.family: "Lato"
                color: "#FFFFFF"
            }

            // High / Low temperatures
            RowLayout {
                spacing: 10
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    text: qsTr("H: %0 °%1")
                        .arg(celsius ? fahrenheitToCelsius(highTempF) : highTempF)
                        .arg(celsius ? "C" : "F")
                    font.pixelSize: 14
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }

                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    text: qsTr("L: %0 °%1")
                        .arg(celsius ? fahrenheitToCelsius(lowTempF) : lowTempF)
                        .arg(celsius ? "C" : "F")
                    font.pixelSize: 14
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }
            }
        }

        // Spacer
        Item { Layout.preferredHeight: 1 }

        // Additional weather info
        RowLayout {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            ColumnLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    text: qsTr("Precipitation: 2%")
                    font.pixelSize: 14
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }
                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    text: qsTr("Humidity: 81%")
                    font.pixelSize: 14
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }
                Text {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    text: qsTr("Wind: 3 mph")
                    font.pixelSize: 14
                    font.weight: Font.Light
                    font.family: "Lato"
                    color: "#FFFFFF"
                }
            }

            Item { Layout.fillWidth: true }
        }

        // Unit toggle buttons
        RowLayout {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            Item { Layout.fillWidth: true }

            ColumnLayout {
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                // Fahrenheit button
                Rectangle {
                    id: fButton
                    width: 30; height: 30
                    radius: 5
                    color: weatherWidget.celsius ? "#00000000" : "#444444"
                    border.color: "#FFFFFF"
                    border.width: 1
                    MouseArea {
                        anchors.fill: parent
                        onClicked: weatherWidget.celsius = false
                        cursorShape: Qt.PointingHandCursor
                    }

                    Text {
                        anchors.centerIn: parent
                        text: "°F"
                        font.pixelSize: 20
                        font.weight: weatherWidget.celsius ? Font.Light : Font.Bold
                        color: "#FFFFFF"
                    }
                }

                Rectangle {
                    width: 30
                    height: 2
                    radius: 5
                    color: weatherWidget.celsius ? "#00000000" : "#FFFFFF"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.bottom
                    anchors.topMargin: 2
                }
            }

            Rectangle {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                width: 2
                height: 20
                color: "#252525"
                radius: 5
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                // Celsius button
                Rectangle {
                    id: cButton
                    width: 30; height: 30
                    radius: 5
                    color: weatherWidget.celsius ? "#444444" : "#00000000"
                    border.color: "#FFFFFF"
                    border.width: 1
                    MouseArea {
                        anchors.fill: parent
                        onClicked: weatherWidget.celsius = true
                        cursorShape: Qt.PointingHandCursor
                    }

                    Text {
                        anchors.centerIn: parent
                        text: "°C"
                        font.pixelSize: 20
                        font.weight: weatherWidget.celsius ? Font.Bold : Font.Light
                        color: "#FFFFFF"
                    }
                }

                Rectangle {
                    width: 30
                    height: 2
                    radius: 5
                    color: weatherWidget.celsius ? "#FFFFFF" : "#00000000"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.bottom
                    anchors.topMargin: 2
                }
            }
        }
    }
}
