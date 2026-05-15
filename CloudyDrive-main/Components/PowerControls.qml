import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../controls"

Rectangle {
    id: root
    color: "#151515"
    Layout.preferredWidth: 270
    Layout.preferredHeight: 270
    radius: 15

    signal modeChanged(int index)
    signal powerOff()

    ColumnLayout {
        spacing: 20
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        Text {
            Layout.leftMargin: 20
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: qsTr("Power Controls")
            font.pixelSize: 20
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#80FFFFFF"
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20
            Layout.leftMargin: 8

            PrefsButton {
                backgroundColor: "transparent"
                setIcon: "qrc:/assets/icons/Back Arrow.svg"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    if (swipView.currentIndex > 0)
                        swipView.currentIndex--
                }
            }

            SwipeView {
                id: swipView
                clip: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                currentIndex: 0
                Layout.preferredWidth: root.width * 0.5
                Layout.preferredHeight: 50
                onCurrentIndexChanged: root.modeChanged(currentIndex)

                Item {
                    RowLayout {
                        anchors.centerIn: parent
                        spacing: 10
                        Text {
                            text: qsTr("ECO Mode")
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            font.family: "Lato"
                            color: "#4EB93D"
                        }
                        Image {
                            source: "qrc:/assets/icons/Eco Leaf Icon 2.svg"
                        }
                    }
                }

                Item {
                    RowLayout {
                        anchors.centerIn: parent
                        spacing: 10
                        Text {
                            text: qsTr("Sport Mode")
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            font.family: "Lato"
                            color: "#00A3FF"
                        }
                        Image {
                            source: "qrc:/assets/icons/Sport Flag Icon.svg"
                        }
                    }
                }

                Item {
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Normal")
                        font.pixelSize: 20
                        font.weight: Font.Bold
                        font.family: "Lato"
                        color: "#FFFFFF"
                    }
                }
            }

            PrefsButton {
                backgroundColor: "transparent"
                setIcon: "qrc:/assets/icons/Front Arrow.svg"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    if (swipView.currentIndex < 2)
                        swipView.currentIndex++
                }
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.preferredWidth: root.width * 0.9
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: {
                switch(swipView.currentIndex) {
                    case 0: return qsTr("ECO Mode saves on battery consumption as you drive.")
                    case 1: return qsTr("Sport Mode gives you a more engaging drive, but uses up more battery.")
                    default: return qsTr("Normal Mode gives you a balance between performance & battery life.")
                }
            }
            font.pixelSize: 14
            font.family: "Lato"
            horizontalAlignment: Text.AlignHCenter
            color: "#80FFFFFF"
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
            spacing: 10

            Text {
                text: qsTr("Vehicle Power Off")
                font.pixelSize: 20
                font.weight: Font.Bold
                font.family: "Lato"
                color: "#CB2020"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.powerOff()
                }
            }

            PrefsButton {
                backgroundColor: "transparent"
                iconColor: "#CB2020"
                setIcon: "qrc:/assets/icons/Power Icon.svg"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: root.powerOff()
            }
        }
    }
}
