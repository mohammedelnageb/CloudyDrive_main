import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: rectangle
    width: 270
    height: 270
    radius: 15
    color: "#151515"

    property int vehicleMode: 0
    property alias titleText: _text.text

    RowLayout {
        anchors.centerIn: parent
        spacing: 30

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 20

            Text {
                id: _text
                text: qsTr("Adaptive Cruise Control")
                font.pixelSize: 20
                font.bold: true
                font.family: "Lato"
                color: "#FFFFFF80" // 50% alpha
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    CheckBox {
        id: checkBox
        text: qsTr("On")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        font.pointSize: 11

        onCheckedChanged: {
            image.visible = !checkBox.checked
            image1.visible = checkBox.checked

            adaptive.adaptiveStatus = checkBox.checked ? 1 : 0
            adaptive.saveAdaptiveStatus()
        }

        contentItem: Text {
            text: checkBox.text
            color: "#FFFFFF"
            font.pointSize: 11
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Image {
        id: image
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 40
        width: 100
        height: 100
        visible: true
        source: "qrc:/assets/icons/BatteryIcon.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 40
        width: 100
        height: 100
        visible: false
        source: "qrc:/assets/icons/Car Settings Icon.svg"
        fillMode: Image.PreserveAspectFit
    }

    Component.onCompleted: {
        adaptive.loadAdaptiveStatus()
        checkBox.checked = adaptive.adaptiveStatus === 1
        image.visible = !checkBox.checked
        image1.visible = checkBox.checked
    }
}
