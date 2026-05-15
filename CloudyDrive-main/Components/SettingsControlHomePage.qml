import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../controls"

SettingsControlBasePage {
    id: root
    pageTitle: qsTr("Settings")

    contentItem: ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        RowLayout {
            Layout.leftMargin: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 10

            Image {
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                source: "qrc:/assets/icons/left-arrow.svg"
            }

            Text {
                Layout.rightMargin: 20
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredWidth: root.width * 0.7
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                text: qsTr("Select a part to view or change settings")
                font.pixelSize: 14
                font.family: "Lato"
                horizontalAlignment: Text.AlignHCenter
                color: "#80FFFFFF"  // white at 50% opacity
            }
        }
    }
}
