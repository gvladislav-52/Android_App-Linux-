import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    property variant static_index
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
                        view_my_food.visible = false
                        view_my_food.enabled = false
                        food_list.enabled = true
                    }
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                font.pixelSize: parent.height
                text: qsTr("Просмотр еды")
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
            Layout.preferredHeight: parent.height * 0.1
            Layout.preferredWidth: parent.width * 0.9
            border.color: "black"
            radius: 10
            color: "#121212"

            Rectangle
            {
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
                height: parent.height * 0.5
                width: parent.width * 0.95
                color: "transparent"

                Text
                {
                    anchors
                    {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }

                    text: "Название:"
                    font.pixelSize: parent.height * 0.7
                    color: "gray"
                }

                Rectangle
                {
                    anchors
                    {
                        right: parent.right
                    }
                    height: parent.height
                    width: parent.width * 0.6
                    clip: true
                    color: "transparent"
                TextInput
                {
                    id: naming_food
                    anchors
                    {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                    }

                    text: My_food_temp.my_food_static[static_index]
                    font.pixelSize: parent.height * 0.7
                    color: "white"

                    onAccepted: {
                        focus = false
                    }
                }
                }
                clip: true
            }

            Rectangle
            {
                anchors
                {
                    bottom: parent.bottom
                    bottomMargin: parent.height * 0.1
                    horizontalCenter: parent.horizontalCenter
                }

                color: "green"
                height: parent.height * 0.05
                width: parent.width * 0.95
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
                                text: index + " " + Deitary_temp.note_string[index]
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
                    Deitary_temp.add_note_string()
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
                    My_food_temp.redact_my_food(static_index, naming_food.text)
                    view_my_food.visible = false
                    view_my_food.enabled = false
                    food_list.enabled = true
                }
            }
        }
    }
}
