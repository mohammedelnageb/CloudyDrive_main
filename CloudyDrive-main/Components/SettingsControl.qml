import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    width: 270
    height: 415
    color: "#151515"
    radius: 15

    StackView {
        id: pageStack
        anchors.fill: parent
        initialItem: settingsHomePage
        clip: true

        pushEnter: Transition {
            PropertyAnimation { property: "opacity"; from: 0; to: 1; duration: 0 }
        }
        pushExit: Transition {
            PropertyAnimation { property: "opacity"; from: 1; to: 0; duration: 0 }
        }
        popEnter: Transition {
            PropertyAnimation { property: "opacity"; from: 0; to: 1; duration: 0 }
        }
        popExit: Transition {
            PropertyAnimation { property: "opacity"; from: 1; to: 0; duration: 0 }
        }
    }

    Component {
        id: settingsHomePage
        SettingsControlHomePage {}
    }

    Component {
        id: tirePressurePage
        SettingsControlTirePressure {
            onBackPressed: pageStack.pop(null)
            objectName: "SettingsControlTirePressure"
        }
    }

    Component {
        id: seatAdjustment
        SettingsControlSeatAdjustment {
            onBackPressed: pageStack.pop(null)
            objectName: "SettingsControlSeatAdjustment"
        }
    }

    Component {
        id: engineSettings
        SettingsControlEngine {
            onBackPressed: pageStack.pop(null)
            objectName: "SettingsControlEngine"
        }
    }

    Component {
        id: backStorageSettings
        SettingsControlBackStorage {
            onBackPressed: pageStack.pop(null)
            objectName: "SettingsControlBackStorage"
        }
    }

    Component {
        id: mirrorAdjustment
        SettingsControlMirrorAdjustment {
            objectName: "SettingsControlMirrorAdjustment"
            onBackPressed: pageStack.pop(null)
        }
    }

    function switchPage(index) {
        if (!pageStack.currentItem) return;

        switch(index) {
        case VehicleSkeletonTile.VehicleParts.LEFT_TOP_TIRE:
        case VehicleSkeletonTile.VehicleParts.RIGHT_TOP_TIRE:
        case VehicleSkeletonTile.VehicleParts.LEFT_BOTTOM_TIRE:
        case VehicleSkeletonTile.VehicleParts.RIGHT_BOTTOM_TIRE:
            if (pageStack.currentItem.objectName !== "SettingsControlTirePressure") {
                pageStack.replace(tirePressurePage);
            }
            break;

        case VehicleSkeletonTile.VehicleParts.DRIVER_SEAT:
        case VehicleSkeletonTile.VehicleParts.DRIVER_SIDE_SEAT:
        case VehicleSkeletonTile.VehicleParts.BACK_SEAT:
            if (pageStack.currentItem.objectName !== "SettingsControlSeatAdjustment") {
                pageStack.replace(seatAdjustment);
            }
            break;

        case VehicleSkeletonTile.VehicleParts.LEFT_TOP_MIRROR:
        case VehicleSkeletonTile.VehicleParts.RIGHT_TOP_MIRROR:
            if (pageStack.currentItem.objectName !== "SettingsControlMirrorAdjustment") {
                pageStack.replace(mirrorAdjustment);
            }
            break;

        case VehicleSkeletonTile.VehicleParts.TOP_ENGINE:
            if (pageStack.currentItem.objectName !== "SettingsControlEngine") {
                pageStack.replace(engineSettings);
            }
            break;

        case VehicleSkeletonTile.VehicleParts.BACK_STORAGE:
            if (pageStack.currentItem.objectName !== "SettingsControlBackStorage") {
                pageStack.replace(backStorageSettings);
            }
            break;

        default:
            // Optional: Return to home page or do nothing
        }
    }
}
