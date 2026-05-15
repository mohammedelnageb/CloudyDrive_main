import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "../controls"

Image {
    id: root
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    source: "qrc:/assets/carIcons/vehicle.png"
    property color backgroundColor: "#00000000"

    signal componentSelected(int index)

    // left top most tire
    Rectangle {
        width: 34; height: 60; radius: 8
        color: root.backgroundColor
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 16
        anchors.topMargin: 52

        PulseButton {
            isWarning: true
            width: 14; height: 14
            radius: height / 2
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.source = iconProvider(root.VehicleParts.LEFT_TOP_TIRE)
            }
        }
    }

    // ... (repeat for other Rectangles, replacing VehicleSkeletonTile.VehicleParts with root.VehicleParts)

    // VehicleParts enum
    enum VehicleParts {
        LEFT_TOP_TIRE,
        RIGHT_TOP_TIRE,
        LEFT_BOTTOM_TIRE,
        RIGHT_BOTTOM_TIRE,
        DRIVER_SEAT,
        DRIVER_SIDE_SEAT,
        BACK_SEAT,
        LEFT_TOP_MIRROR,
        RIGHT_TOP_MIRROR,
        TOP_ENGINE,
        BACK_STORAGE
    }

    function iconProvider(request) {
        componentSelected(request)
        switch(request) {
        case root.VehicleParts.LEFT_TOP_TIRE:
            return "qrc:/assets/carIcons/leftTopTire.png";
        case root.VehicleParts.RIGHT_TOP_TIRE:
            return "qrc:/assets/carIcons/righttopTire.png";
        case root.VehicleParts.LEFT_BOTTOM_TIRE:
            return "qrc:/assets/carIcons/lowerLeftire.png";
        case root.VehicleParts.RIGHT_BOTTOM_TIRE:
            return "qrc:/assets/carIcons/lowerRightTire.png";
        case root.VehicleParts.DRIVER_SEAT:
            return "qrc:/assets/carIcons/DriverSeat.png";
        case root.VehicleParts.DRIVER_SIDE_SEAT:
            return "qrc:/assets/carIcons/DriverSideSeat.png";
        case root.VehicleParts.BACK_SEAT:
            return "qrc:/assets/carIcons/BackSeat.png";
        case root.VehicleParts.LEFT_TOP_MIRROR:
            return "qrc:/assets/carIcons/LeftSideMirror.png";
        case root.VehicleParts.RIGHT_TOP_MIRROR:
            return "qrc:/assets/carIcons/RightSideMirror.png";
        case root.VehicleParts.TOP_ENGINE:
            return "qrc:/assets/carIcons/frontEngine.png";
        case root.VehicleParts.BACK_STORAGE:
            return "qrc:/assets/carIcons/BackStorage.png";
        default:
            return "qrc:/assets/carIcons/vehicle.png";
        }
    }
}
