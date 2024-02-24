import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts
Item {
    visible: true
    width: 200
    height: 220

        ColumnLayout {
            spacing: 10
            anchors.centerIn: parent

            Repeater {
                model: 4
                Rectangle {
                    width: 180
                    height: 100
                    color: "lightblue"
                    border.color: "blue"

                    ColumnLayout {
                        spacing: 2
                        Repeater {
                            model: 4
                            Rectangle {
                                width: 170
                                height: 10
                                color: "lightgreen"
                            }
                        }
                    }
                }
            }
        }

    Button {
        text: "Добавить прямоугольники"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            for (var i = 0; i < repeaters.children.length; i++) {
                repeaters.children[i].visible = !repeaters.children[i].visible;
            }
        }
    }
}
