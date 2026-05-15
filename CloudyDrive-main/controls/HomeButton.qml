import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

RadioButton {
    id: control

    property string setIcon: ""
    property bool isGlow: false

    implicitHeight: 125
    implicitWidth: 125
    indicator: null  // Hide the default radio indicator

    Image {
        id: iconImage
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        visible: setIcon !== ""
        source: setIcon
        scale: control.pressed ? 0.9 : 1.0
        Behavior on scale { NumberAnimation { duration: 200 } }
        z: 1
    }

    background: Rectangle {
        id: backgroundRect
        anchors.fill: parent
        radius: 15
        color: "#252525"
        border.color: control.checked ? "#FFFFFF" : "transparent"
        border.width: 4

        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }

        Rectangle {
            id: indicator
            property real mx: 0
            property real my: 0
            x: mx - width / 2
            y: my - height / 2
            width: 0
            height: width
            radius: width / 2
            color: isGlow ? Qt.lighter("#29BEB6") : Qt.lighter("#B8FF01")
            opacity: 0
        }
    }

    Rectangle {
        id: mask
        radius: 15
        anchors.fill: parent
        visible: false
    }

    OpacityMask {
        anchors.fill: backgroundRect
        source: backgroundRect
        maskSource: mask
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            control.checked = true // THIS is crucial
            indicator.mx = mouseX
            indicator.my = mouseY
            anim.restart()
        }
    }



    ParallelAnimation {
        id: anim
        NumberAnimation {
            target: indicator
            property: "width"
            from: 0
            to: control.height * 1.1
            duration: 200
        }
        NumberAnimation {
            target: indicator
            property: "opacity"
            from: 0.9
            to: 0
            duration: 200
        }
    }
}
