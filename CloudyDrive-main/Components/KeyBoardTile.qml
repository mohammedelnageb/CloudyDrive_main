import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../controls" // Assuming your own controls are here

Rectangle {
    id: root
    width: 561
    height: heightOfTile
    property int heightOfTile: 270
    color: "#151515"
    radius: 15

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 0

                Item {
                    Layout.preferredHeight: 50
                    Layout.fillWidth: true

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Recents")
                        font.pixelSize: 14
                        font.weight: Font.Bold
                        font.family: "Lato"
                        color: Qt.rgba(1, 1, 1, 0.5)  // #FFFFFF80 approx 50% opacity white
                    }
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.bottomMargin: 20
                    clip: true

                    ListView {
                        width: parent.width
                        height: parent.height
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.top: parent.top
                        model: 10
                        spacing: 5
                        clip: true

                        delegate: ItemDelegate {
                            width: 400
                            height: 55
                            background: null
                            contentItem: Item {
                                anchors.fill: parent
                                anchors.leftMargin: 10
                                anchors.topMargin: 5
                                anchors.bottomMargin: 5

                                ColumnLayout {
                                    anchors.left: parent.left
                                    anchors.verticalCenter: parent.verticalCenter

                                    Text {
                                        font.pixelSize: 14
                                        font.weight: Font.Bold
                                        font.family: "Lato"
                                        color: "#FFFFFF"
                                        text: qsTr("IKEA")
                                    }
                                    Text {
                                        font.pixelSize: 14
                                        font.family: "Lato"
                                        color: Qt.rgba(1, 1, 1, 0.5)  // 50% opacity white
                                        text: qsTr("2149 Fenton Pkwy, San Diego, CA 92108")
                                    }
                                }

                                Rectangle {
                                    anchors.bottom: parent.bottom
                                    anchors.left: parent.left
                                    height: 4
                                    width: parent.width
                                    radius: 5
                                    color: "#252525"
                                }
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.preferredWidth: 4
            Layout.preferredHeight: parent.height * 0.9
            color: "#252525"
            radius: 5
        }

        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: 100

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 0

                Item {
                    Layout.preferredHeight: 50
                    Layout.fillWidth: true

                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Favorites")
                        font.pixelSize: 14
                        font.weight: Font.Bold
                        font.family: "Lato"
                        color: Qt.rgba(1, 1, 1, 0.5)
                    }
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.bottomMargin: 20
                    clip: true

                    ListView {
                        width: parent.width
                        height: parent.height
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top

                        model: ListModel {
                            ListElement { addIcon: "qrc:/assets/icons/Home-icon-Add.svg" }
                            ListElement { addIcon: "qrc:/assets/icons/Work-icon-add.svg" }
                            ListElement { addIcon: "qrc:/assets/icons/Plus-icon-add.svg" }
                        }

                        spacing: 10
                        clip: true

                        delegate: PrefsButton {
                            radius: 8
                            setIcon: addIcon
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }
    }
}
