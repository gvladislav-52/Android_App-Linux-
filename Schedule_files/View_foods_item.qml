import QtQuick 2.15
import QtQuick.Controls
Rectangle {
    anchors.fill: parent
    color: "#121212"
    property variant index_temp
    Rectangle
    {
        id: headerfoods
        anchors
        {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width
        height: parent.height * 0.1
        color: "#1e1e1e"

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
            Text
            {
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
                font.pixelSize: parent.height * 0.5
                text: "Записать"
                width: parent.width
                color: "white"
            }
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
                    view_foods_item.visible = false
                    view_foods_item.enabled = false
                    foods_menu.visible = true
                    foods_menu.enabled = true
                }
            }
        }
    }

    Rectangle
    {
        id: schedule_foods
        color: "#1e1e1e"
        width: parent.width * 0.95
        height: parent.height * 0.2

        anchors
        {
            top: headerfoods.bottom
            topMargin: parent.height * 0.025
            horizontalCenter: parent.horizontalCenter
        }
        radius: parent.height * 0.02
        border.color: "black"

        Text
        {
            id: text_time
            anchors
            {
                left: parent.left
                leftMargin: parent.width * 0.025
                top: parent.top
                topMargin: parent.height * 0.05
            }
            text: "Время приема пищи"
            font.pixelSize: parent.height * 0.1
            color: "gray"
            font.bold: true
        }

        ComboBox {
            id: comboBox
            anchors {
                left: parent.left
                leftMargin: parent.width * 0.05
                top: text_time.top
                topMargin: parent.height * 0.3
            }
            width: parent.width * 0.9
            height: parent.height * 0.5

            model: ["Завтрак", "Второй завтрак", "Обед", "Полдник", "Ужин", "Второй ужин"]
            currentIndex: 0

            background: Rectangle {
                color: "transparent"
            }
            font.bold: true
        }
    }

    Rectangle
    {
        color: "#1e1e1e"
        width: parent.width * 0.95
        height: parent.height * 0.25

        anchors
        {
            top: schedule_foods.bottom
            topMargin: parent.height * 0.035
            horizontalCenter: parent.horizontalCenter
        }
        radius: parent.height * 0.02
        border.color: "black"

        Text
        {
            id: text_rect_
            anchors
            {
                left: parent.left
                leftMargin: parent.width * 0.025
                top: parent.top
                topMargin: parent.height * 0.05
            }
            text: "Блюдо"
            font.pixelSize: schedule_foods.height * 0.1
            color: "gray"
            font.bold: true
        }

        Rectangle
        {
            id: rect_foods_item
            anchors
            {

                top: parent.top
                topMargin: text_rect_.height *2
                bottom: parent.bottom
                bottomMargin: parent.height * 0.075
                horizontalCenter: parent.horizontalCenter
            }
            width: parent.width * 0.9
            height: parent.height * 0.6
            color: "transparent"

            Text
            {
                id: foods_
                anchors
                {
                    top: parent.top
                    topMargin: parent.height * 0.05
                    left: parent.left
                }
                font.pixelSize: parent.height * 0.2
                text: Table_food.Naming_food[index_temp]
                color: "white"

                Rectangle
                {
                    color: "gray"
                    anchors
                    {
                        top: parent.bottom
                        left: parent.left
                    }
                    width: rect_foods_item.width
                    height: parent.height * 0.05
                }
            }

            Text
            {
                id: text_kol
                anchors
                {
                    top: foods_.bottom
                    topMargin: parent.height * 0.15
                    left: parent.left
                }
                text: "Количество"
                font.pixelSize: schedule_foods.height * 0.1
                color: "gray"
                font.bold: true
            }

            Item {
                anchors
                {
                    top: text_kol.bottom
                    topMargin: parent.height * 0.1
                    left: parent.left
                }
                width: parent.width
                height: parent.height * 0.2

                Text
                {
                    id: num_kol
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        leftMargin: parent.width * 0.05
                    }
                    text: "1 "
                    color: "gray"
                    font.pixelSize: schedule_foods.height * 0.125
                    font.bold: true

                    Rectangle
                    {
                        anchors
                        {
                            top:parent.bottom
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: parent.height * 2
                        height: parent.height * 0.1
                        color: "gray"
                    }
                }

                Text
                {
                    anchors
                    {
                        top: parent.top
                        left: num_kol.right
                        leftMargin: parent.width * 0.1
                    }
                    text: "     x     порция (" + Table_food.Data_food[(index_temp*6)+5] + " г)"
                    color: "white"
                    font.pixelSize: schedule_foods.height * 0.125
                }
            }
        }
    }

    Rectangle
    {
        color: "green"
        width: parent.width * 0.95
        height: parent.height * 0.1

        anchors
        {
            bottom: parent.bottom
            bottomMargin: parent.height * 0.1
            horizontalCenter: parent.horizontalCenter
        }
        radius: parent.height * 0.02
        border.color: "black"

        Text
        {
            anchors
            {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            text: qsTr("Добавить еду в расписание")
            color: "white"
            font.pixelSize: parent.height * 0.25
        }
    }
}