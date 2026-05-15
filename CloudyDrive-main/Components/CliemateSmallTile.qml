import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle
    width: 270
    height: 270
    color: "#151515"
    radius: 20
    border.color: "#000000"
    border.width: 0

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        RowLayout {
            spacing: 10

            ColumnLayout {
                Text {
                    text: qsTr("Forward Collision")
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    font.family: "Lato"
                    color: "#FFFFFF80" // Semi-transparent white
                }
            }
        }
    }

    CheckBox {
        id: checkBox
        text: qsTr("On")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

        font.weight: Font.Bold
        font.pointSize: 18

        onToggled: {
            image.visible = !checkBox.checked;
            image1.visible = checkBox.checked;
            forwardCollision.collisionStatus = checkBox.checked ? 1 : 0;
            forwardCollision.saveCollisionStatus();
        }

        contentItem: Text {
            text: checkBox.text
            color: "#ffffff"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 11
            font.bold: true
        }
    }

    Image {
        id: image
        anchors.centerIn: parent
        width: 100
        height: 100
        visible: true
        source: "qrc:/assets/icons/Cloud Icon.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        anchors.centerIn: parent
        width: 100
        height: 100
        visible: false
        source: "../assets/icons/Air Windshield.svg"
        fillMode: Image.PreserveAspectFit
    }

    Component.onCompleted: {
        forwardCollision.loadCollisionStatus();
        checkBox.checked = forwardCollision.collisionStatus === 1;
        image.visible = !checkBox.checked;
        image1.visible = checkBox.checked;
    }
}
