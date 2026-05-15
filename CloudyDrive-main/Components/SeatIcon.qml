import QtQuick 2.15
import QtGraphicalEffects 1.15

Item {
    id: root
    width: 80
    height: 80
    clip: true

    property color color: "#FFFFFF"
    property string source: "qrc:/assets/seatIcons/mdi--car-seat.svg"

    Image {
        id: imageIcon
        width: 60
        height: 60
        anchors.centerIn: parent
        source: root.source
        smooth: true
        fillMode: Image.PreserveAspectFit
    }

    ColorOverlay {
        anchors.fill: imageIcon
        source: imageIcon
        color: root.color
        z: 1
    }
}
