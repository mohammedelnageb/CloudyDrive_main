import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../controls"

SettingsControlBasePage {
    id: root
    pageTitle: qsTr("Tire Pressure")

    contentItem: ColumnLayout {
        anchors.centerIn: parent
        spacing: 40

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 50

            TirePressureInfo {
                isWarning: true
                value: 20
                title: qsTr("Front L")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
            TirePressureInfo {
                title: qsTr("Front R")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 40

            TirePressureInfo {
                isError: true
                value: 10
                title: qsTr("Back L")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
            TirePressureInfo {
                title: qsTr("Back R")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
        }
    }
}
