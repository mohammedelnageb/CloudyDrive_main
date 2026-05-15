import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15  // Use Controls 2 instead of Basic

Rectangle {
    color: "#151515"
    width: 270
    height: 125
    radius: 15

    ColumnLayout {
        anchors.centerIn: parent
        Text {
            id: timeText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pixelSize: 36
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#FFFFFF"
        }
        Text {
            id: dateText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pixelSize: 14
            font.weight: Font.Light
            font.family: "Lato"
            color: "#FFFFFF"
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateDateTime()
    }

    Component.onCompleted: updateDateTime()

    function updateDateTime() {
        var now = new Date()
        timeText.text = formatTime(now)
        dateText.text = formatDate(now)
    }

    function formatDate(date) {
        var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        return days[date.getDay()] + ", " + months[date.getMonth()] + " " + date.getDate() + " " + date.getFullYear();
    }

    function formatTime(date) {
        var hours = date.getHours()
        var minutes = date.getMinutes()
        var ampm = hours >= 12 ? "PM" : "AM"
        hours = hours % 12
        hours = hours ? hours : 12
        minutes = minutes < 10 ? "0" + minutes : minutes
        return hours + ":" + minutes + " " + ampm
    }
}
