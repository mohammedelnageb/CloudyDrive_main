import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../controls"

SettingsControlBasePage {
    id: root
    pageTitle: qsTr("Seat Adjustment")

    contentItem: ColumnLayout {
        anchors.centerIn: parent
        spacing: 12

        Item { Layout.fillHeight: true }

        Text {
            Layout.topMargin: 5
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Driver’s Seat")
            font.pixelSize: 14
            font.family: "Lato"
            horizontalAlignment: Text.AlignHCenter
            color: "#80FFFFFF" // 50% opacity white instead of Style.alphaColor
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20
            Layout.leftMargin: 8

            PrefsButton {
                backgroundColor: "transparent"
                setIcon: "qrc:/assets/icons/Back Arrow.svg"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    if (swipView.currentIndex !== 0)
                        swipView.currentIndex--
                }
            }

            SwipeView {
                id: swipView
                clip: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                currentIndex: 0
                Layout.preferredWidth: root.width * 0.5
                Layout.preferredHeight: 75

                SeatIcon { source: "qrc:/assets/seatIcons/mdi--car-seat.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--car-seat-heater.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--car-seat-cooler.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-recline-extra.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-passenger.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-legroom-normal.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-legroom-extra.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-individual-suite.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-flat-angled.svg" }
            }

            PrefsButton {
                backgroundColor: "transparent"
                setIcon: "qrc:/assets/icons/Front Arrow.svg"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    if (swipView.currentIndex !== 8)
                        swipView.currentIndex++
                }
            }
        }

        // Repeat same structure for Driver’s Side Seat
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Driver’s Side Seat")
            font.pixelSize: 14
            font.family: "Lato"
            horizontalAlignment: Text.AlignHCenter
            color: "#80FFFFFF"
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20
            Layout.leftMargin: 8

            PrefsButton {
                backgroundColor: "transparent"
                setIcon: "qrc:/assets/icons/Back Arrow.svg"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    if (swipView2.currentIndex !== 0)
                        swipView2.currentIndex--
                }
            }

            SwipeView {
                id: swipView2
                clip: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                currentIndex: 0
                Layout.preferredWidth: root.width * 0.5
                Layout.preferredHeight: 75

                SeatIcon { source: "qrc:/assets/seatIcons/mdi--car-seat.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--car-seat-heater.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--car-seat-cooler.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-recline-extra.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-passenger.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-legroom-normal.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-legroom-extra.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-individual-suite.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-flat-angled.svg" }
            }

            PrefsButton {
                backgroundColor: "transparent"
                setIcon: "qrc:/assets/icons/Front Arrow.svg"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    if (swipView2.currentIndex !== 8)
                        swipView2.currentIndex++
                }
            }
        }

        // Driver’s Back Seat
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Driver’s Back Seat")
            font.pixelSize: 14
            font.family: "Lato"
            horizontalAlignment: Text.AlignHCenter
            color: "#80FFFFFF"
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            spacing: 20
            Layout.leftMargin: 8

            PrefsButton {
                backgroundColor: "transparent"
                setIcon: "qrc:/assets/icons/Back Arrow.svg"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    if (swipView3.currentIndex !== 0)
                        swipView3.currentIndex--
                }
            }

            SwipeView {
                id: swipView3
                clip: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                currentIndex: 0
                Layout.preferredWidth: root.width * 0.5
                Layout.preferredHeight: 75

                SeatIcon { source: "qrc:/assets/seatIcons/mdi--car-seat.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--car-seat-heater.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--car-seat-cooler.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-recline-extra.svg" }
                SeatIcon { source: "qrc:/assets/seatIcons/mdi--seat-passenger.svg" }
            }

            PrefsButton {
                backgroundColor: "transparent"
                setIcon: "qrc:/assets/icons/Front Arrow.svg"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                onClicked: {
                    if (swipView3.currentIndex !== 4)
                        swipView3.currentIndex++
                }
            }
        }

        Item { Layout.fillHeight: true }
    }
}
