import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: "#121212"

    Rectangle
    {
        id: search_item
        color: "#121212"
        height: parent.height* 0.1
        width: parent.width
        anchors
        {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        Image {
            source: "qrc:/ui/Image Header/arrow.png"
            mirror: true
            width: parent.height * 0.3
            height: parent.height * 0.3
            fillMode: Image.PreserveAspectCrop
            anchors
            {
                left: parent.left
                leftMargin: parent.width * 0.025
                verticalCenter: parent.verticalCenter
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    foods_menu.visible = false
                    foods_menu.enabled = false
                    schedule_temp.visible = true
                    schedule_temp.enabled = true
                }
            }
        }

        Image {
            source: "qrc:/ui/Image Main/dot.png"
            width: parent.height * 0.3
            height: parent.height * 0.3
            fillMode: Image.PreserveAspectCrop
            anchors
            {
                right: parent.right
                rightMargin: parent.width * 0.025
                verticalCenter: parent.verticalCenter
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    console.log("MENU")
                }
            }
        }

        Rectangle
        {
            anchors
            {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
            color: "transparent"
            width: parent.width * 0.65
            height: parent.height * 0.65
            clip: true
            TextInput
            {
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
                font.pixelSize: parent.height * 0.5
                text: "Искать все"
                width: parent.width
                color: "gray"

                onAccepted: {
                    focus = false
                }
            }
        }

        Rectangle
        {
            color: "gray"
            height: parent.height * 0.025
            width: parent.width
            anchors
            {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }
        }
    }

    Rectangle
    {
        id: button_item
        color: "#121212"
        height: parent.height* 0.075
        width: parent.width
        anchors
        {
            top: search_item.bottom
            horizontalCenter: parent.horizontalCenter
        }
        Rectangle
        {
            color: "gray"
            height: parent.height * 0.035
            width: parent.width
            anchors
            {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }
        }

        ScrollView
        {
            anchors.fill: parent
            clip: true
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            contentWidth: parent.width * 1.25

            RowLayout
            {
                id: button_menu_food
                height: parent.height * 0.9
                width: parent.width * 0.9
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

            Rectangle
            {
                color: "green"
                Layout.preferredWidth: parent.width * 0.15
                Layout.preferredHeight: parent.height * 0.8
                Layout.alignment: Qt.AlignVCenter
                radius: parent.height * 0.4
                border.color: "black"

                Text
                {
                    color: "white"
                    text: "Всё"
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                    font.pixelSize: parent.height * 0.5
                }
            }

            Rectangle
            {
                color: "#1e1e1e"
                Layout.preferredWidth: parent.width * 0.25
                Layout.preferredHeight: parent.height * 0.8
                Layout.alignment: Qt.AlignVCenter
                radius: parent.height * 0.4
                border.color: "black"

                RowLayout
                {
                    width: parent.width * 0.85
                    height: parent.height * 0.9
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    Image {
                        source: "qrc:/ui/Image Food/apple.png"
                        Layout.preferredWidth: parent.height * 0.6
                        Layout.preferredHeight: parent.height * 0.6
                        fillMode: Image.PreserveAspectCrop
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text
                    {
                        color: "gray"
                        text: "Продукты"
                        font.pixelSize: parent.height * 0.5
                        Layout.alignment: Qt.AlignVCenter
                    }
                }
            }

            Rectangle
            {
                color: "#1e1e1e"
                Layout.preferredWidth: parent.width * 0.25
                Layout.preferredHeight: parent.height * 0.8
                Layout.alignment: Qt.AlignVCenter
                radius: parent.height * 0.4
                border.color: "black"

                RowLayout
                {
                    width: parent.width * 0.85
                    height: parent.height * 0.9
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    Image {
                        source: "qrc:/ui/Image NaviBar/food.png"
                        Layout.preferredWidth: parent.height * 0.6
                        Layout.preferredHeight: parent.height * 0.6
                        fillMode: Image.PreserveAspectCrop
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text
                    {
                        color: "gray"
                        text: "Моя еда"
                        font.pixelSize: parent.height * 0.5
                        Layout.alignment: Qt.AlignVCenter
                    }
                }
            }

            Rectangle
            {
                color: "#1e1e1e"
                Layout.preferredWidth: parent.width * 0.25
                Layout.preferredHeight: parent.height * 0.8
                Layout.alignment: Qt.AlignVCenter
                radius: parent.height * 0.4
                border.color: "black"

                RowLayout
                {
                    width: parent.width * 0.85
                    height: parent.height * 0.9
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    Image {
                        source: "qrc:/ui/Image NaviBar/book.png"
                        Layout.preferredWidth: parent.height * 0.6
                        Layout.preferredHeight: parent.height * 0.6
                        fillMode: Image.PreserveAspectCrop
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Text
                    {
                        color: "gray"
                        text: "Рецепты"
                        font.pixelSize: parent.height * 0.5
                        Layout.alignment: Qt.AlignVCenter
                    }
                }
            }
            }
        }
    }

    Item
    {
        id: text_food
        width: parent.width
        height: parent.height-(search_item.height+button_item.height)
        anchors
        {
            horizontalCenter: parent.horizontalCenter
            top: button_item.bottom
        }

        Text
        {
            id: text_food_name
            anchors
            {
                top: parent.top
                left: parent.left
                topMargin: parent.height * 0.025
                leftMargin: parent.width * 0.05
            }
            color: "gray"
            font.pixelSize: parent.height * 0.025
            font.bold: true
            text: qsTr("Популярные позиции")
        }

        Item
        {
            id: eat_stack
            width: parent.width
            height: parent.height - text_food_name.height
            anchors.top: text_food_name.bottom
        ScrollView
        {
            anchors.fill: parent
            clip: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn
            contentWidth: parent.width
            contentHeight: lol.height

            ColumnLayout
            {
                id: lol
                width: parent.width * 0.95
                anchors.horizontalCenter: parent.horizontalCenter
                Repeater
                {
                    id: repetor
                    model: Table_food.Naming_food.length

                    RowLayout
                    {
                        id: food_item_col
                        Layout.preferredWidth: eat_stack.width
                        Layout.preferredHeight: eat_stack.height * 0.1

                        Rectangle
                        {
                            Layout.alignment:   Qt.AlignLeft | Qt.AlignVCenter

                            Layout.preferredWidth: parent.height * 0.7
                            Layout.preferredHeight: parent.height * 0.7
                            color: "gray";
                            radius: 10

                            Text
                            {
                                text: "i"
                                color: "black"
                                anchors
                                {
                                    verticalCenter: parent.verticalCenter
                                    horizontalCenter: parent.horizontalCenter
                                }
                                font.pixelSize: parent.height * 0.5
                            }
                        }

                        Text {
                            id: name
                            Layout.alignment:   Qt.AlignLeft | Qt.AlignVCenter
                            Layout.leftMargin: parent.width * 0.075
                            color: "white"
                            text: Table_food.Naming_food[index]
                            font.pixelSize: parent.height * 0.3
                            Layout.fillWidth: true
                        }

                        Item
                        {
                            Layout.alignment:   Qt.AlignRight| Qt.AlignVCenter

                            Layout.preferredWidth: parent.height * 0.7
                            Layout.preferredHeight: parent.height* 0.7

                            Text
                            {
                                anchors
                                {
                                    top: parent.top
                                    right: parent.right
                                }

                                text: Table_food.Data_food[index*6] + " ккал."
                                color: "gray"
                                font.pixelSize: parent.height * 0.35
                            }

                            Text
                            {
                                anchors
                                {
                                    bottom: parent.bottom
                                    right: parent.right
                                }
                                text: Table_food.Data_food[(index*6)+5] +"г"
                                color: "gray"
                                font.pixelSize: parent.height * 0.35
                            }
                        }

                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                view_foods_item.index_temp = index
                                view_foods_item.visible = true
                                view_foods_item.enabled = true
                                foods_menu.visible = false
                                foods_menu.enabled = false
                            }
                        }
                    }
                }
            }
        }
        }
    }

}
