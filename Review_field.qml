import QtQuick 2.15
import QtQuick.Layouts

Item
{

    GridLayout {
        id: menu_gridlayout
            columns: 2
            rows: 2
            height: parent.height*0.25
            width: parent.width*0.9
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            Rectangle
            {
                Layout.preferredHeight: parent.height/2
                Layout.preferredWidth: parent.width/2.01
                color: "#1e1e1e"
                border.color: "black"
                radius: 10

                Text
                {
                    id: reception_text
                    text:  "Прием"
                    color: "gray"
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.1
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.2
                }

                Text
                {
                    text:  "0 ккал"
                    color: "#FFFFFF"
                    anchors
                    {
                        top: reception_text.top
                        left: parent.left
                        topMargin: parent.height *0.3
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.3
                }
            }

            Rectangle
            {
                Layout.preferredHeight: parent.height/2
                Layout.preferredWidth: parent.width/2.01
                anchors.right: parent.right
                color: "#1e1e1e"
                border.color: "black"
                radius: 10

                Text
                {
                    id: activity_text
                    text:  "Деятельность"
                    color: "gray"
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.1
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.2
                }

                Text
                {
                    text:  "-0 ккал"
                    color: "#FFFFFF"
                    anchors
                    {
                        top: activity_text.top
                        left: parent.left
                        topMargin: parent.height *0.3
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.3
                }
            }

            Rectangle
            {
                Layout.preferredHeight: parent.height/2
                Layout.preferredWidth: parent.width/2.01
                color: "#1e1e1e"
                border.color: "black"
                radius: 10

                Text
                {
                    id: drinking_text
                    text:  "Питьевой режим"
                    color: "gray"
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.1
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.2
                }

                Text
                {
                    id: drinking_text_two
                    text:  "0 л"
                    color: "#FFFFFF"
                    anchors
                    {
                        top: drinking_text.top
                        left: parent.left
                        topMargin: parent.height *0.25
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.3
                }

                Text
                {
                    text:  "из 2,88 л"
                    color: "gray"
                    anchors
                    {
                        top: drinking_text_two.top
                        left: parent.left
                        topMargin: parent.height *0.35
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.2
                }
            }

            Rectangle
            {
                Layout.preferredHeight: parent.height/2
                Layout.preferredWidth: parent.width/2.01
                anchors.right: parent.right
                color: "#1e1e1e"
                border.color: "black"
                radius: 10

                Text
                {
                    id: weight_text
                    text:  "Вес"
                    color: "gray"
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.1
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.2
                }

                Text
                {
                    id: weight_text_two
                    text:  "72 кг"
                    color: "#FFFFFF"
                    anchors
                    {
                        top: weight_text.top
                        left: parent.left
                        topMargin: parent.height *0.25
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.3
                }

                Text
                {
                    text:  "цель: 77 кг"
                    color: "gray"
                    anchors
                    {
                        top: weight_text_two.top
                        left: parent.left
                        topMargin: parent.height *0.35
                        leftMargin: parent.width*0.05
                    }
                    font.pixelSize: parent.height *0.2
                }
            }
        }
}
