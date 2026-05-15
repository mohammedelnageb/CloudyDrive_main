import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "../Components"

Item {
    id: root
    anchors.fill: parent
    signal powerOff()

    GridLayout {
        id: grid
        anchors.fill: parent
        anchors.rightMargin: 50
        anchors.bottomMargin: 20
        anchors.topMargin: 20

        rows: 1
        columns: 3
        rowSpacing: 20
        columnSpacing: 20

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            Item {
                width: parent.width
                height: parent.height

                Speedometer {
                    anchors.right: parent.right  // Align to the right
                    anchors.verticalCenter: parent.verticalCenter  // Keep vertically centered
                    anchors.margins: -150  // Adjust margin as needed
                }
            }
        }

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            // Uncomment and add your components here when needed
            // SettingsControl {}
            // PowerControls { onPowerOff: root.powerOff() }
        }

        ColumnLayout {
            spacing: 20
            Layout.row: 0
            Layout.column: 2
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            DateTimeTile {}

            // Uncomment your tiles here
            // BatteryTile {}
            // NotificationTile {}
        }
    }
}
