import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Item {
    id: speedometer
    width: 300
    height: 300

    property real arcRadius: 90
    property real outerRadius: Math.min(width, height) / 2
    property real arcAngle: 180

    property real minValue: 0
    property real maxValue: 250
    property real value: 0

    function speedColor(value) {
        if (value < 60) return "green";
        else if (value < 150) return "yellow";
        else return "red";
    }

    function valueToAngle(value) {
        var minAngle = 135;  // degrees, start of arc (0 km/h)
        var maxAngle = 405;  // degrees, end of arc (max speed)

        return minAngle + ((value - minValue) / (maxValue - minValue)) * (maxAngle - minAngle);
    }

    Timer {
        id: updateTimer
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            value += 5;
            if (value > maxValue) value = minValue;
        }
    }
    onValueChanged: {
        circularCanva.requestPaint();  // Ensure canvas updates when value changes

            arcCanvas.requestPaint();  // Ensure canvas updates when value changes

        }

    Image {
        id: background
        source: "qrc:/assets/icons/Ellipse 1.svg"
        anchors.centerIn: parent
    }

    // Max Limit icon
    Image {
        sourceSize: Qt.size(16, 17)
        source: "qrc:/assets/icons/maxLimit.svg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 340

        x: outerRadius + arcRadius * Math.cos(Math.PI * arcAngle / 180)
        y: outerRadius + arcRadius * Math.sin(Math.PI * arcAngle / 180)
    }

    Canvas {
                   id:circularCanva

                   anchors.fill: parent

                   Component.onCompleted: requestPaint()

                   function degreesToRadians(degrees) {
                       return degrees * (Math.PI / 180);
                   }

                   function createLinearGradient(ctx, start, end, colors) {
                       var gradient = ctx.createLinearGradient(start.x, start.y, end.x, end.y);
                       for (var i = 0; i < colors.length; i++) {
                           gradient.addColorStop(i / (colors.length - 1), colors[i]);
                       }
                       return gradient;
                   }

                   onPaint: {
                       var ctx = getContext("2d");
                       ctx.reset();

                       // Define the gradient colors for the filled arc
                       var gradientColors = [
                                   "#AAFFFF",// Start color
                                   "#AAFFFF",    // End color
                               ];

                       // Calculate the start and end angles for the filled arc
                       var startAngle = valueToAngle(minValue) - 90;
                       var endAngle = valueToAngle(250) - 90;

                       // Create a linear gradient
                       var gradient = createLinearGradient(ctx, { x: 0, y: 0 }, { x: outerRadius * 2, y: 0 }, gradientColors);

                       // Loop through the gradient colors and fill the arc segment with each color
                       for (var i = 0; i < gradientColors.length; i++) {
                           var gradientColor = gradientColors[i];
                           var angle = startAngle + (endAngle - startAngle) * (i / (gradientColors.length - 1));

                           ctx.beginPath();
                           ctx.lineWidth = 1.5;
                           ctx.strokeStyle = gradient;
                           ctx.arc(outerRadius,
                                                          outerRadius,
                                                          outerRadius - 5,
                                                         startAngle,
                                                         endAngle);                           ctx.stroke();
                       }
                   }
               }


    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var startAngle = (valueToAngle(minValue) - 90) * Math.PI / 180;
            var endAngle = (valueToAngle(maxValue) - 90) * Math.PI / 180;

            var gradient = ctx.createLinearGradient(0, 0, outerRadius * 2, 0);
            gradient.addColorStop(0, "#163546");
            gradient.addColorStop(1, "#163546");

            ctx.beginPath();
            ctx.lineWidth = outerRadius * 0.15;
            ctx.strokeStyle = gradient;
            ctx.arc(width / 2, height / 2, width / 2 - 20, startAngle, endAngle);
            ctx.stroke();
        }
    }

    Canvas {
        id: arcCanvas
        width: parent.width
        height: parent.height

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var startAngle = Math.PI * 0.75;
            var endAngle = Math.PI * (0.75 + 1.5 * (value / maxValue));

            var gradient = ctx.createLinearGradient(0, 0, outerRadius * 2, 0);
            gradient.addColorStop(0, "#6369FF");
            gradient.addColorStop(0.33, "#63FFFF");
            gradient.addColorStop(0.66, "#FFFF00");
            gradient.addColorStop(1, "#FF0000");

            ctx.beginPath();
            ctx.lineWidth = 30;
            ctx.strokeStyle = gradient;
            ctx.arc(width / 2, height / 2, width / 2 - 20, startAngle, endAngle);
            ctx.stroke();
        }
    }

    Item {
        id: needleContainer
        width: outerRadius * 0.7
        height: outerRadius * 0.2
        anchors.centerIn: parent

        Image {
            id: needle
            source: "qrc:/assets/icons/Rectangle 4.svg"
            width: height * 0.06
            height: parent.height
            asynchronous: true
            antialiasing: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        transform: Rotation {
            origin.x: needleContainer.width / 2
            origin.y: needleContainer.height
            angle: (value - minValue) / (maxValue - minValue) * 270 - 135
        }
    }

    Glow {
        anchors.fill: needle
        radius: 10
        samples: 16
        color: "white"
        source: needle
    }

    Image {
        id: foreground
        source: "qrc:/assets/icons/Subtract.svg"
        anchors.centerIn: parent
    }

    Image {
        id: centerCircle
        source: "qrc:/assets/icons/Ellipse 6.svg"
        anchors.centerIn: parent
    }

    Image {
        id: center
        source: "qrc:/assets/icons/ring.svg"
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -10
    }

    ColumnLayout {
        anchors.centerIn: parent
        Label {
            text: Math.round(value)
            font.pixelSize: 65
            color: "#FFFFFF"
        }
        Label {
            text: "km/h"
            font.pixelSize: 18
            color: "#FFFFFF"
            opacity: 0.4
        }
    }
}
