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

    Connections {
        target: listView

        // Handle the signal emitted when a persona slot is clicked
        onPersonaClicked: {
            // Navigate to the persona details page
            var personaDetailsScreen = Qt.createComponent("PersonaDetailsScreen.qml");
            if (personaDetailsScreen.status === Component.Ready) {
                var personaDetailsScreenObject = personaDetailsScreen.createObject(null);
                personaDetailsScreenObject.personaData = personaData;
                personaDetailsScreenObject.backClicked.connect(goBack);
            }
        }
    }

    function goBack() {
        // Destroy the current persona details page and navigate back to the main page
        personaDetailsScreenObject.destroy();
    }

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
               source: "qrc:/System icons/hlogo.png" // Replace with your logo image path
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
                  source: "qrc:/System icons/settings.png"
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

            delegate: Item {
               width: parent.width
               height: 70

                property var personaData: personaList[index]
              
              MouseArea {
            anchors.fill: parent
            onClicked: {
            // Emit a signal with the personaData when a slot is clicked
                clickedPersonaSignal(personaData);
                // Handle click event to navigate to the persona details screen
                // You can implement the navigation logic here
                // For example, you can create a signal in your main QML file and emit it with the personaData when a slot is clicked,
                // and then connect this signal to a function that handles the navigation to the persona details screen
            }
        }

              // ATTRIBUTES FOR THE PERSONA SLOTS WITHIN THE LIST
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
         }
      }
   }
   
   property var personaList: [{
         "name": "Clone Arnie",
         // Clone Arnie
         "tag": "Confused & Hostile",
         "language": "ENG",
         "source": "qrc:/Persona icons/Clone Arnie_120.png" // Replace with the image path for Persona 1
      }, {
         "name": "Batuman",
         // Batuman
         "tag": "Paranoid & Insecure",
         "language": "ENG",
         "source": "qrc:/Persona icons/Batuman_120.png"
      }, {
         "name": "Zane the Liberator",
         // Zane the Liberator
         "tag": "Criminal & Mad",
         "language": "ENG",
         "source": "qrc:/Persona icons/Zane the Liberator_120.png"
      }, {
         "name": "Rosie",
         // Rosie
         "tag": "Helpful & Kind",
         "language": "ENG",
         "source": "qrc:/Persona icons/Rosie_120.png"
      }, {
         "name": "Byard the Forgotten",
         // Byard the Forgotten
         "tag": "Trickster & Pirate",
         "language": "ENG",
         "source": "qrc:/Persona icons/Byard the Forgotten_120.png"
      }, {
         "name": "Capt'n William Sattson",
         // Capt'n William Sattson
         "tag": "Delusional & Senile",
         "language": "ENG",
         "source": "qrc:/Persona icons/Captn Sattson_120.png"
      }, {
         "name": "Francesca",
         // Francesca
         "tag": "Seductive & Manipulative",
         "language": "ENG",
         "source": "qrc:/Persona icons/Francesca_120.png"
      }, {
         "name": "Jure Mućkaš",
         // Jure Mućkaš
         "tag": "Šaljivđija & Filozof",
         "language": "HRV",
         "source": "qrc:/Persona icons/Jure Muckas_120.png"
      }, {
         "name": "El Bandito",
         // El Bandito
         "tag": "Političar & Radoholičar",
         "language": "HRV",
         "source": "qrc:/Persona icons/El Bandito_120.png"
      }, {
         "name": "Dva Slovoneca",
         // Dva Slovoneca
         "tag": "Pričljivi & Živahni",
         "language": "HRV",
         "source": "qrc:/Persona icons/Dva Slovo-neca_120.png"
      }, {
         "name": "Gym trainer",
         // Gym trainer
         "tag": "Energetic & Funny",
         "language": "ENG",
         "source": "qrc:/Persona icons/Gym trainer_120.png"
      }, {
         "name": "Zane the Liberator",
          // Barkeep Jonathan
         "tag": "Relatable & Helpful",
         "language": "ENG",
         "source": "qrc:/Persona icons/Barkeep Jonathan_120.png"
      }, {
         "name": "Comrade Bir",
         // Comrade Bir
         "tag": "Talkative & Funny",
         "language": "ENG",
         "source": "qrc:/Persona icons/Comrade Bir_120.png"
      }, {
         "name": "Butler Jones",
         // Butler Jones
         "tag": "Sarcastic & Refined",
         "language": "ENG",
         "source": "qrc:/Persona icons/Butler Jones_120.png"
      }, {
         "name": "The German Doctor",
         // The German Doctor
         "tag": "Insane & Pyschopath",
         "language": "ENG",
         "source": "qrc:/Persona icons/German doctor_120.png"
      }, {
         "name": "Creepy Stalker",
         // Creepy Stalker
         "tag": "Unnerving & Intrusive",
         "language": "ENG",
         "source": "qrc:/Persona icons/Creepy stalker_120.png"
      }, {
         "name": "Neighbour Abdul",
         // Neighbour Abdul
         "tag": "Neurotic & Impatient",
         "language": "ENG",
         "source": "qrc:/Persona icons/Neighbour Abdul_120.png"
      }
      // Add more personas as needed
      ,]
}

 