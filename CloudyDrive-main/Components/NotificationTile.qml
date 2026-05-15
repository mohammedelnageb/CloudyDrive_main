// import QtQuick
// import QtQuick.Layouts
// import QtQuick.Controls.Basic
// import Style 1.0
// import "../controls"

// Rectangle {
//     color: "#151515"
//     Layout.preferredWidth: 270
//     Layout.preferredHeight: 270
//     radius: 15

//     // خاصية لتحديد نوع الإشعار
//       //  property string notificationType: "l" // يمكنك تغيير القيمة لاختبار أنواع مختلفة
//     property string notificationType: notificationManager.notificationType

//     ColumnLayout {
//         spacing: 20
//         anchors.left: parent.left
//         anchors.leftMargin: 65
//         anchors.verticalCenterOffset: -109
//         anchors.verticalCenter: parent.verticalCenter
//         Text {
//             Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//             text: qsTr("Notifications")
//             font.pixelSize: 20
//             font.weight: Font.Bold
//             font.family: "Lato"
//             color: Style.alphaColor("#FFFFFF",0.5)
//         }

//         // ColumnLayout {
//         //     Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//         //     spacing: 5

//         //     RowLayout {
//         //         Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//         //         spacing: 10
//         //         Text {
//         //             Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//         //             text: qsTr("Check Tire Pressure")
//         //             font.pixelSize: 20
//         //             font.weight: Font.Bold
//         //             font.family: "Lato"
//         //             color: "#FFB800"
//         //         }

//         //         PrefsButton {
//         //             backgroundColor: "#00000000"
//         //             iconColor: "#FFB800"
//         //             Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//         //             setIcon: "qrc:/assets/icons/Tire Pressure Icon.svg"
//         //         }
//         //     }

//         //     Text {
//         //         Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//         //         text: qsTr("Maintenance Required")
//         //         font.pixelSize: 14
//         //         font.weight: Font.Light
//         //         font.family: "Lato"
//         //         color: "#FFFFFF"
//         //     }
//         // }

//         // Text {
//         //     Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//         //     text: qsTr("Go to Car Settings")
//         //     font.pixelSize: 20
//         //     font.weight: Font.Bold
//         //     font.underline: true
//         //     font.family: "Lato"
//         //     color: "#FFFFFF"
//         // }

//         // Rectangle {
//         //     Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//         //     width: 217
//         //     height: 5
//         //     color: "#252525"
//         //     radius: 5
//         // }

//         // Text {
//         //     Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//         //     text: qsTr("No incoming calls")
//         //     font.pixelSize: 20
//         //     font.weight: Font.Bold
//         //     font.family: "Lato"
//         //     color: "#FFFFFF"
//         // }
//     }

//     Image {
//         id: image
//         x: 52
//         y: 75
//         width: 148
//         height: 133
//         //visible: notificationType === "b" // يظهر فقط إذا كان الإشعار هو "b"
//         visible: notificationManager.notificationType === "b"
//         //blind spot warning
//         //b
//         source: "../assets/icons/Air Up.svg"
//         fillMode: Image.PreserveAspectFit


//     }
//     Image {
//         id: image1
//         x: 50
//         y: 56
//         width: 148
//         height: 133
//         //visible: notificationType === "f" // يظهر فقط إذا كان الإشعار هو "f"
//         visible: notificationManager.notificationType === "f"

//         //forward collision warning
//         //f
//         source: "../assets/icons/Air Back Window.svg"
//         fillMode: Image.PreserveAspectFit
//     }

//     Image {
//         id: image2
//         x: 52
//         y: 81
//         width: 148
//         height: 133
//         visible: notificationType === "l" // يظهر فقط إذا كان الإشعار هو "l"
//         //visible: notificationManager.notificationType === "l"

//         //lane descipline warning
//         //l
//         source: "../assets/icons/Air Down.svg"
//         fillMode: Image.PreserveAspectFit
//     }

// }




import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../controls"

Rectangle {
    color: "#151515"
    Layout.preferredWidth: 270
    Layout.preferredHeight: 270
    radius: 15

    ColumnLayout {
        spacing: 20
        anchors.left: parent.left
        anchors.leftMargin: 65
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -109

        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: qsTr("Notifications")
            font.pixelSize: 20
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#80FFFFFF"  // semi-transparent white (opacity ~50%)
        }
    }

    Image {
        id: imageBlindSpot
        x: 52
        y: 75
        width: 148
        height: 133
        visible: notificationManager.notificationType === "b"
        source: "../assets/icons/Air Up.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: imageForwardCollision
        x: 50
        y: 56
        width: 148
        height: 133
        visible: notificationManager.notificationType === "f"
        source: "../assets/icons/Air Back Window.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: imageLaneDiscipline
        x: 52
        y: 81
        width: 148
        height: 133
        visible: notificationManager.notificationType === "l"
        source: "../assets/icons/Air Down.svg"
        fillMode: Image.PreserveAspectFit
    }
}
