import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "../Components"

Item {
    anchors.fill: parent

    GridLayout {
        id: grid
        anchors.fill: parent
        anchors.leftMargin: -16
        anchors.rightMargin: 66
        anchors.bottomMargin: 222
        anchors.topMargin: -182

        rows: 3
        columns: 2
        rowSpacing: 20
        columnSpacing: 20

        CameraView {
            Layout.row: 0
            Layout.column: 0
            Layout.rowSpan: 1
            Layout.columnSpan: 2
        }

        ColumnLayout {
            spacing: 20
            Layout.row: 1
            Layout.column: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            DateTimeTile {}
            BatteryTile { color: "#71aa26"}
        }

        RowLayout {
            spacing: 20
            Layout.row: 1
            Layout.column: 1

            CliemateSmallTile {}
            MusicSmallTile {}
        }

        NotificationTile {
            focus: true
            Layout.row: 2
            Layout.column: 0
            Layout.columnSpan: 2
        }
    }
}
