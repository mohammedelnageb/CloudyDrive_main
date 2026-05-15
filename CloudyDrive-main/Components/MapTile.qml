import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtLocation 5.15
import QtPositioning 5.15
import "../controls"

Rectangle {
    color: "#151515"
    radius: 15

    Plugin {
        id: mapPlugin
        name: "osm"
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(30.618424, 32.269533) // Ismailia
        zoomLevel: 14
        copyrightsVisible: false

        function updateLocation(latitude, longitude) {
            map.center = QtPositioning.coordinate(latitude, longitude);
        }

        property var startCentroid: null

        PinchHandler {
            id: pinch
            target: map
            onActiveChanged: {
                if (active) {
                    map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                }
            }
            onScaleChanged: (delta) => {
                map.zoomLevel += Math.log2(delta)
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            onRotationChanged: (delta) => {
                map.bearing -= delta
                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
            }
            grabPermissions: PointerHandler.TakeOverForbidden
        }

        WheelHandler {
            id: wheel
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                ? PointerDevice.Mouse | PointerDevice.TouchPad
                : PointerDevice.Mouse
            rotationScale: 1/120
            property: "zoomLevel"
            target: map
        }

        DragHandler {
            id: drag
            target: map
            onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
        }

        Shortcut {
            enabled: map.zoomLevel < map.maximumZoomLevel
            sequence: StandardKey.ZoomIn
            onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
        }

        Shortcut {
            enabled: map.zoomLevel > map.minimumZoomLevel
            sequence: StandardKey.ZoomOut
            onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
        }
    }

    Rectangle {
        z: 55
        color: "transparent"
        anchors.centerIn: parent
        width: parent.width + 15
        height: parent.height + 15
        radius: 15
        border.width: 10
        border.color: "#000000"
    }

    TextField {
        id: searchField
        z: 6
        width: 509
        height: 45
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#FFFFFF"
        font.family: "Lato"
        font.pixelSize: 14
        font.weight: Font.Bold
        placeholderText: qsTr("Enter an address")
        leftPadding: 15
        placeholderTextColor: "#80FFFFFF"  // 50% white transparency

        background: Rectangle {
            anchors.fill: parent
            radius: 45
            color: "#E43F3F3F"  // equivalent to Style.alphaColor("#252525", 0.9)
        }

        onAccepted: {
            searchAddress(text)
        }
    }

    // Search address via OpenStreetMap Nominatim API
    function searchAddress(address) {
        if (address.length === 0) return;

        var xhr = new XMLHttpRequest();
        var apiUrl = "https://nominatim.openstreetmap.org/search?format=json&q=" + encodeURIComponent(address);

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.length > 0) {
                        var latitude = response[0].lat;
                        var longitude = response[0].lon;
                        map.center = QtPositioning.coordinate(parseFloat(latitude), parseFloat(longitude));
                        map.zoomLevel = 14;
                    } else {
                        console.log("No results found for the entered address.");
                    }
                } else {
                    console.log("Error in API request: " + xhr.status);
                }
            }
        };

        xhr.open("GET", apiUrl);
        xhr.send();
    }

    function updateLiveLocation(latitude, longitude) {
        map.updateLocation(latitude, longitude);
        console.log("Live location updated to: " + latitude + ", " + longitude);
    }
}
