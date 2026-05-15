import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0

Button {
    id: control
    property alias setIcon: imageIcon.source
    property string setText: ""
    property bool isGlow: false
    property real radius: height / 2
    property color iconColor: "#FFFFFF"
    property color backgroundColor: "#252525"

    implicitHeight: 40
    implicitWidth: 40
    hoverEnabled: true
    text: ""  // disable default text rendering

    background: Rectangle {
        anchors.fill: parent
        radius: control.radius
        color: control.backgroundColor
        border.color: control.down ? "#FFFFFF" : "transparent"
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
            height: width
            radius: width / 2
            color: control.isGlow ? Qt.lighter("#29BEB6") : Qt.lighter("#B8FF01")
            opacity: 0
        }
    }

    Image {
        id: imageIcon
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        visible: setIcon !== ""
        scale: control.down ? 0.9 : 1.0
        Behavior on scale { NumberAnimation { duration: 200 } }
    }

    Text {
        id: textLabel
        anchors.centerIn: parent
        text: control.setText
        color: iconColor
        visible: setText !== ""
        scale: control.down ? 0.9 : 1.0
        Behavior on scale { NumberAnimation { duration: 200 } }
    }

    ColorOverlay {
        anchors.fill: imageIcon
        source: imageIcon
        color: iconColor
    }

    onPressed: {
        indicator.mx = width / 2
        indicator.my = height / 2
        anim.restart()
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
