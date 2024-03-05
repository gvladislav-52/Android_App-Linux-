import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    width: parent.width * 0.9
    height: parent.height * 0.8
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    color: "#1e1e1e"
    border.color: "black"
    radius: 10

    ColumnLayout
    {
        anchors.fill: parent

        Rectangle
        {
            Layout.preferredHeight: parent.height * 0.05
            Layout.preferredWidth: parent.width * 0.95
            Layout.alignment: Qt.alignTop | Qt.AlignHCenter
            Layout.topMargin: parent.height * 0.01
            color: "transparent"

            Image
            {
                anchors
                {
                    bottom: parent.bottom
                    left: parent.left
                }
                source: "qrc:/ui/Image Header/arrow.png"
                width: parent.height * 0.7
                height: parent.height*0.7
                fillMode: Image.PreserveAspectFit
                mirror: true

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        add_my_food.visible = false
                        add_my_food.enabled = false
                        food_list.enabled = true
                    }
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                font.pixelSize: parent.height
                text: qsTr("Создание еды")
                color: "white"
            }

            Rectangle
            {
                anchors.top: parent.bottom
                anchors.topMargin: parent.height * 0.4
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height * 0.1
                width: parent.width * 0.95
                color: "gray"
            }
        }

        Rectangle
        {
            Layout.alignment: Qt.alignTop | Qt.AlignHCenter
            Layout.topMargin: parent.height * 0.05
            Layout.preferredHeight: parent.height * 0.15
            Layout.preferredWidth: parent.width * 0.9
            border.color: "black"
            radius: 10
            color: "#121212"

            Text
            {
                anchors
                {
                    top: parent.top
                    topMargin: parent.height * 0.1
                    left: parent.left
                    leftMargin: parent.width * 0.025
                }

                text: "Название:"
                font.pixelSize: parent.height * 0.15
                color: "lightgray"
            }

            Rectangle
            {
                anchors
                {
                    bottom: parent.bottom
                    bottomMargin: parent.height * 0.1
                    horizontalCenter: parent.horizontalCenter
                }
                height: parent.height * 0.5
                width: parent.width * 0.95
                color: "transparent"

                TextInput
                {
                    id: naming_food
                    anchors
                    {
                        left: parent.left
                        bottom: parent.bottom
                        bottomMargin: parent.height * 0.1
                    }

                    text: "Название еды"
                    color: "white"
                    font.pixelSize: parent.height * 0.4
                    width: parent.width
                }

                Rectangle
                {
                    anchors
                    {
                        bottom: parent.bottom
                    }

                    color: "green"
                    height: parent.height * 0.05
                    width: parent.width
                }
                clip: true
            }
        }

        Rectangle
        {
            id: my_food_list
            Layout.alignment: Qt.alignTop | Qt.AlignHCenter
            Layout.preferredHeight: parent.height * 0.4
            Layout.preferredWidth: parent.width * 0.9
            radius: 10
            border.color: "black"
            color: "#121212"

            ScrollView
            {
                anchors.fill: parent
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                contentHeight: my_food_column.height

            ColumnLayout {
                id: my_food_column
                width: parent.width *0.9
                anchors
                {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
                }

                    Repeater {
                        id: my_food_list_repeater
                        model: 0

                        RowLayout {
                            Layout.preferredHeight: my_food_list.height* 0.2
                            Layout.preferredWidth: parent.width

                            Text
                            {
                                text: index + " " + Nutriton_temp.note_string[index]
                                color: "gray"
                                font.pixelSize: parent.height * 0.3
                                Layout.alignment: Qt.ALignLeft | Qt.AlignVCenter
                                Layout.leftMargin: parent.width * 0.03
                                Layout.fillWidth: true
                            }

                            Image
                            {
                                Layout.alignment: Qt.ALignRight| Qt.AlignVCenter
                                Layout.rightMargin: parent.width * 0.03
                                source: "qrc:/ui/Image Main/cancel.jpg"
                                Layout.preferredHeight: parent.height * 0.4
                                Layout.preferredWidth: parent.height * 0.4
                            }
                        }
                    }
                }
            }
        }

        Item
        {
            Layout.preferredHeight: parent.height* 0.1
            Layout.preferredWidth: parent.width*0.6
            Layout.alignment: Qt.AlignHCenter

            Image
            {
                anchors
                {
                left: parent.left
                verticalCenter: parent.verticalCenter
                }
                source: "qrc:/ui/Image Main/addfile.jpg"
                height: parent.height * 0.3
                width: parent.height * 0.3
            }

            Text
            {
                text: "Добавить продукт"
                anchors
                {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                color: "green"
                font.pixelSize: parent.height * 0.3
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    Nutriton_temp.add_note_string()
                    my_food_list_repeater.model = my_food_list_repeater.model+1
                }
            }
        }

        Item
        {
            Layout.fillHeight: true
        }

        Rectangle
        {
            Layout.alignment: Qt.alignBottom | Qt.AlignHCenter
            Layout.bottomMargin: parent.height * 0.05
            Layout.preferredHeight: parent.height * 0.1
            Layout.preferredWidth: parent.width * 0.9
            radius: 10
            color: "green"
            border.color: "black"

            Text
            {
                anchors
                {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                text: "Сохранить"
                font.pixelSize: parent.height *0.4
                color: "white"
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    Account_temp.my_food_object.add_my_food(naming_food.text)
                    my_food_repeater.model = Account_temp.my_food_object.my_food_static.length
                    add_my_food.visible = false
                    add_my_food.enabled = false
                    food_list.enabled = true
                }
            }
        }
    }
}
