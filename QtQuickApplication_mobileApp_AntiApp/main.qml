import QtQuick 6.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.15
import QtQml 2.15
import QtMultimedia 5.15

ApplicationWindow {
   visible: true
   width: 400
   height: 800
   title: "Mobile App"

   // Background color
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

            // App name logo
            Image {
               source: "qrc:/hlogo.png" // Replace with your logo image path
               width: 55 // Adjust the width as needed
               height: 25 // Adjust the height as needed
               anchors.centerIn: parent
            }

            // Settings icon container
            Rectangle {
               width: 50
               height: 50
               color: "#364753"
               radius: 5
               x: 5
               anchors.verticalCenter: parent.verticalCenter

               // Settings icon
               Image {
                  source: "settings.png"
                  anchors.centerIn: parent
                  width: 18
                  height: 18
               }
            }
         }

         // Text message rectangle
         Rectangle {
            width: parent.width
            height: 50
            color: "lightgrey"

            Text {
               text: "Click on a persona to learn more about it.\nWhen you're ready, select the one you like!"
               anchors.centerIn: parent
               font.bold: false
               font.pixelSize: 14
            }
         }

         // List view
         ListView {
            width: parent.width
            height: 1500
            model: personaList.length
            spacing: 8

            // Add MouseArea for scrolling
    MouseArea {
        anchors.fill: parent
        propagateComposedEvents: true

        onPressed: {
            listView.contentItem.forceActiveFocus()
            listView.interactive = true
            listView.touchPointId = touchPoint.id
            listView.touchStartY = touchPoint.y
            listView.startOffset = listView.contentY
        }

        onPositionChanged: {
            if (listView.interactive && listView.touchPointId === touchPoint.id) {
                var deltaY = touchPoint.y - listView.touchStartY
                listView.contentY = listView.startOffset - deltaY
            }
        }

        onReleased: {
            listView.interactive = false
        }

        // Allow scrolling even when the mouse is outside the ListView
        hoverEnabled: true
    }


            delegate: Item {
               width: parent.width
               height: 70
             
               property var personaData: personaList[index]

               

               Rectangle {
                  width: parent.width
                  height: parent.height
                  color: "#48b17f" // boja sa persona SLOTS
                        

                  // TEKST JEZIKA
                  Text {
                     text: personaData.language
                     font.bold: false
                     font.pixelSize: 12
                    color: "white"
                     //opacity: 0.7
                     x: 4
                     anchors.verticalCenter: parent.verticalCenter
                     
                  }

                  // SLIKA PERSONE
                  Image {
                     source: personaData.source
                     width: 70
                     height: 70
                     x: 27
                     anchors.verticalCenter: parent.verticalCenter
                  }

                  // IME PERSONE
                  Text {
                     text: personaData.name
                     font.bold: false
                      color: "white"
                     font.pixelSize: 14
                     anchors.left: parent.left
                     anchors.verticalCenter: parent.verticalCenter
                     anchors.leftMargin: 110
                  }

                  // TAG PERSONE
                  Text {
                     text: personaData.tag
                     font.italic: true
                      color: "white"
                     font.pixelSize: 12
                     anchors.right: parent.right
                     anchors.verticalCenter: parent.verticalTop
                     anchors.rightMargin: 10
                  }
   
               }
                               
 
            }
            // Arrow indicator
               Rectangle {
        width: parent.width
        height: 30
        color: "#358DCA" // Choose a color for the arrow indicator
        anchors.bottom: parent.bottom

        Image {
            source: "qrc:/arrow_down.png" // Replace with the path to your arrow icon image
            width: 20 // Adjust the width of the arrow icon
            height: 20 // Adjust the height of the arrow icon
            anchors.centerIn: parent
        }
    }
         }
      }
   }

   property var personaList: [{
         "name": "Clone Arnie",  // Clone Arnie
         "tag": "Confused & Hostile",
         "language": "ENG",
         "source": "qrc:/Clone Arnie_120.png" // Replace with the image path for Persona 1
      }, {
         "name": "Batuman",  // Batuman
         "tag": "Paranoid & Insecure",
          "language": "ENG",
         "source": "qrc:/Batuman_120.png"
      }, {
         "name": "Zane the Liberator",  // Zane the Liberator
         "tag": "Criminal & Mad",
          "language": "ENG",
         "source": "qrc:/Zane the Liberator_120.png"
      },  {
         "name": "Rosie",  // Rosie
         "tag": "Helpful & Kind",
          "language": "ENG",
         "source": "qrc:/Rosie_120.png"
      }, {
         "name": "Byard the Forgotten",  // Byard the Forgotten
         "tag": "Trickster & Pirate",
          "language": "ENG",
         "source": "qrc:/Byard the Forgotten_120.png"
      }, {
         "name": "Capt'n William Sattson",  // Capt'n William Sattson
         "tag": "Delusional & Senile",
          "language": "ENG",
         "source": "qrc:/Captn Sattson_120.png"
      }, {
         "name": "Jure Mućkaš",  // Jure Mućkaš
         "tag": "Šaljivđija & Filozof",
          "language": "HRV",
         "source": "qrc:/Jure Muckas_120.png"
      }, {
         "name": "El Bandito",  // El Bandito
         "tag": "Političar & Radoholičar",
          "language": "HRV",
         "source": "qrc:/El Bandito_120.png"
      }, {
         "name": "Dva Slovoneca",  // Dva Slovoneca
         "tag": "Pričljivi & Živahni",
          "language": "HRV",
         "source": "qrc:/Dva Slovo-neca_120.png"
      }, {
         "name": "Gym trainer",  // Gym trainer
         "tag": "Energetic & Funny",
          "language": "ENG",
         "source": "qrc:/Gym trainer_120.png"
      }, {
         "name": "Zane the Liberator",
         "tag": "Criminal & Mad",
          "language": "ENG",
         "source": "qrc:/Zane the Liberator_120.png"
      }, {
         "name": "Batuman",
         "tag": "Paranoid & Insecure",
          "language": "ENG",
         "source": "qrc:/Batuman_120.png"
      }, {
         "name": "Zane the Liberator",
         "tag": "Criminal & Mad",
          "language": "ENG",
         "source": "qrc:/Zane the Liberator_120.png"
      },
      // Add more personas as needed
   ]
}
