import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../controls"

Rectangle {
    id: root
    color: "#151515"
    Layout.preferredWidth: 270
    Layout.preferredHeight: 270
    property int volumeValue: 25
    property alias mediaControlSelected: swipeView.currentIndex
    radius: 15

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: qsTr("Media Control")
            font.pixelSize: 20
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#808080"  // light gray instead of Style.alphaColor white 50%
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20

            Button {
                background: Rectangle {
                    color: "transparent"
                }
                contentItem: Image {
                    source: "qrc:/assets/icons/Back Arrow.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    anchors.margins: 10
                }
                onClicked: {
                    if (volumeValue > 0) {
                        volumeValue--
                    }
                }
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                implicitWidth: 55
                implicitHeight: 55
            }

            RowLayout {
                spacing: 10
                Layout.preferredWidth: root.width * 0.4
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Item { Layout.fillWidth: true }

                Image {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    source: "qrc:/assets/icons/Volume Icon.svg"
                }

                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    text: qsTr("%0").arg(volumeValue)
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: "Lato"
                    color: "#FFFFFF"
                }

                Item { Layout.fillWidth: true }
            }

            Button {
                background: Rectangle {
                    color: "transparent"
                }
                contentItem: Image {
                    source: "qrc:/assets/icons/Front Arrow.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    anchors.margins: 10
                }
                onClicked: {
                    volumeValue++
                }
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                implicitWidth: 55
                implicitHeight: 55
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            width: 217
            height: 5
            color: "#252525"
            radius: 5
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20
            Layout.leftMargin: 8

            Button {
                background: Rectangle {
                    color: "transparent"
                }
                contentItem: Image {
                    source: "qrc:/assets/icons/Back Arrow.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    anchors.margins: 10
                }
                onClicked: {
                    if (swipeView.currentIndex > 0) {
                        swipeView.currentIndex--
                    }
                }
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                implicitWidth: 55
                implicitHeight: 55
            }

            SwipeView {
                id: swipeView
                clip: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                currentIndex: 0
                Layout.preferredWidth: root.width * 0.4
                Layout.preferredHeight: 50

                Item {
                    clip: true
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Car Play")
                        font.pixelSize: 20
                        font.weight: Font.Bold
                        font.family: "Lato"
                        color: "#FFFFFF"
                    }
                }

                Item {
                    clip: true
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Radio")
                        font.pixelSize: 20
                        font.weight: Font.Bold
                        font.family: "Lato"
                        color: "#FFFFFF"
                    }
                }

                Item {
                    clip: true
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Spotify")
                        font.pixelSize: 20
                        font.weight: Font.Bold
                        font.family: "Lato"
                        color: "#FFFFFF"
                    }
                }
            }

            Button {
                background: Rectangle {
                    color: "transparent"
                }
                contentItem: Image {
                    source: "qrc:/assets/icons/Front Arrow.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    anchors.margins: 10
                }
                onClicked: {
                    if (swipeView.currentIndex < 2) {
                        swipeView.currentIndex++
                    }
                }
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                implicitWidth: 55
                implicitHeight: 55
            }
        }

        Loader {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            sourceComponent: {
                if (swipeView.currentIndex == 0) {
                    return connectedDevice
                } else if (swipeView.currentIndex == 1) {
                    return fmStationConnected
                } else {
                    return spotifyClient
                }
            }
        }
    }

    Component {
        id: connectedDevice
        ConnectedMobileDevice {}
    }

    Component {
        id: fmStationConnected
        ConnectedFMStation {}
    }

    Component {
        id: spotifyClient
        ConnectedSpotifyClient {}
    }
}
