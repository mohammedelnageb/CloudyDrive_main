import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "controls"
import "screens"

Item {
    id: root
    anchors.fill: parent
    signal powerOff()

    ButtonGroup {
        id: navGroup
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Item {
            Layout.preferredWidth: parent.width * 0.2
            Layout.preferredHeight: parent.height

            ColumnLayout {
                anchors.fill: parent
                spacing: 10

                HomeButton {
                    ButtonGroup.group: navGroup
                    checked: true
                    setIcon: "qrc:/assets/icons/Home Icon.svg"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onCheckedChanged: if (checked) sideLoader.sourceComponent = homeScreen
                }

                HomeButton {
                    ButtonGroup.group: navGroup
                    checked: false

                    setIcon: "qrc:/assets/icons/Car Settings Icon1.svg"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onCheckedChanged: if (checked) sideLoader.sourceComponent = carScreen
                }

                HomeButton {
                    ButtonGroup.group: navGroup
                    checked: false

                    setIcon: "qrc:/assets/icons/Navigation Icon.svg"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onCheckedChanged: if (checked) sideLoader.sourceComponent = navigationScreen
                }


                // Uncomment when ready
                // HomeButton {
                //     ButtonGroup.group: navGroup
                //     setIcon: "qrc:/assets/icons/Climate Control Icon.svg"
                //     Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                //     onClicked: sideLoader.sourceComponent = thermoScreen
                // }

                // HomeButton {
                //     ButtonGroup.group: navGroup
                //     setIcon: "qrc:/assets/icons/Media Icon.svg"
                //     Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                //     onClicked: sideLoader.sourceComponent = musicScreen
                // }
            }
        }

        Item {
            Layout.preferredWidth: parent.width * 0.8
            Layout.preferredHeight: parent.height

            Loader {
                id: sideLoader
                anchors.fill: parent
                sourceComponent: homeScreen
            }
        }
    }

    Component { id: homeScreen; HomeScreen {} }
    Component { id: carScreen; CarScreen { onPowerOff: root.powerOff() } }
    Component { id: navigationScreen; NavigationScreen {} }
    // Component { id: thermoScreen; ThermoScreen {} }
    // Component { id: musicScreen; MusicScreen {} }
}
