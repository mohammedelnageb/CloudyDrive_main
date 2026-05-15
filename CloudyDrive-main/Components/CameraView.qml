import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15

Rectangle {
    color: "#151515"
    Layout.preferredWidth: 560
    Layout.preferredHeight: 415
    radius: 15

    Camera {
        id: camera
        // focusMode is NOT available in Qt 5.15, so removed
        // customFocusPoint is unreliable, so commented out
        // customFocusPoint: Qt.point(0.2, 0.2)
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        source: camera
        autoOrientation: true
    }

    // Start camera when component is ready
    Component.onCompleted: camera.start()

    Text {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter

        text: qsTr("Please Check Surroundings For Safety")
        font.pixelSize: 20
        font.weight: Font.Bold
        font.family: "Lato"
        color: "#FFFFFF"
    }
}
