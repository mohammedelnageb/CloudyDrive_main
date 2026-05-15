import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../screens"

Rectangle {
    color: "#151515"
    Layout.preferredWidth: 270
    Layout.preferredHeight: 270
    radius: 15

    ColumnLayout {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -104
        anchors.horizontalCenterOffset: -4
        spacing: 10

        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Lane discipline")
            font.pixelSize: 20
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#808080" // replaced Style.alphaColor white 0.5
        }
    }

    CheckBox {
        id: checkBox
        x: 103
        y: 174
        text: qsTr("On")
        tristate: false

        onToggled: {
            image.visible = !checkBox.checked;
            image1.visible = checkBox.checked;
            lane.laneStatus = checkBox.checked ? 1 : 0;
            lane.saveLaneStatus();
        }

        contentItem: Text {
            color: "#ffffff"
            text: "On"
            anchors.fill: parent
            anchors.leftMargin: 39
            anchors.topMargin: 13
            anchors.bottomMargin: -20
            font.bold: true
            font.pointSize: 11
        }
    }

    Image {
        id: image1
        x: 76
        y: 84
        width: 100
        height: 100
        visible: false
        source: "../assets/icons/Back Arrow.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image
        x: 76
        y: 84
        width: 100
        height: 100
        visible: true
        source: "qrc:/assets/icons/logos--spotify-icon.svg"
        fillMode: Image.PreserveAspectFit
    }

    Component.onCompleted: {
        lane.loadLaneStatus()
        checkBox.checked = lane.laneStatus === 1
        image.visible = !checkBox.checked
        image1.visible = checkBox.checked
    }
}
