import QtQuick 2.15
import QtQuick.Layouts

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

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                font.pixelSize: parent.height
                text: qsTr("Создать еду!")
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

                text: "Название"
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

                text: "Блюда"
                font.pixelSize: parent.height * 0.15
                color: "lightgray"
            }

            Rectangle
            {
                anchors
                {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                height: parent.height * 0.5
                width: parent.width * 0.9
                color: "transparent"

                Text
                {
                    anchors
                    {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.verticalCenter
                    }
                    text: "ДОБАВИТЬ ПОЗИЦИЮ"
                    font.pixelSize: parent.height * 0.35
                    color: "green"
                }
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

                text: "Порция"
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
                    anchors
                    {
                        left: parent.left
                        bottom: parent.bottom
                        bottomMargin: parent.height * 0.1
                    }

                    text: "Количество порций (необязательно)"
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
                    Account_temp.my_food_object.add_my_food()
                    test.model = Account_temp.my_food_object.my_food_static.length
                    add_my_food.visible = false
                    food_list.enabled = true
                }
            }
        }
    }
}
