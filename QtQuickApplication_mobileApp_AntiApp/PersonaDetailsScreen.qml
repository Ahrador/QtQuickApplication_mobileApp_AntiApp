import QtQuick 6.0
import QtQuick.Controls 2.15

Item {
    property var personaData

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#b17f48" // green

        Column {
            spacing: 5
            anchors.centerIn: parent
            anchors.fill: parent

            // Header
            Rectangle {
                width: parent.width
                height: 50
                color: "#364753" // dark blue

                // Back button
                Rectangle {
                    width: 50
                    height: 50
                    color: "#364753"
                    radius: 5
                    x: 5
                    anchors.verticalCenter: parent.verticalCenter

                    Image {
                        source: "qrc:/System icons/back.png"
                        anchors.centerIn: parent
                        width: 18
                        height: 18
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            // Emit a signal to go back to the previous screen
                            backClicked();
                        }
                    }
                }
            }

            // Persona details
            Rectangle {
                width: parent.width
                height: parent.height
                color: "#48b17f" // boja sa persona SLOTS

                // Persona name
                Text {
                    text: personaData.name
                    font.bold: true
                    font.pixelSize: 18
                    color: "white"
                    anchors.centerIn: parent
                }
            }
        }
    }

    signal backClicked()
}
