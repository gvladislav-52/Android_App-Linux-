import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import my_statistic_table_qml

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
                color: reception_mouse_area.pressed?"gray": "#1e1e1e"
                border.color: "black"
                radius: 10

                ColumnLayout
                {
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.1
                        leftMargin: parent.width*0.05
                        bottom: parent.bottom
                    }
                Text
                {
                    id: reception_text
                    text:  "Прием"
                    color: "gray"
                    font.pixelSize: parent.height *0.2
                }

                Text
                {
                    text:  "0 ккал"
                    color: "#FFFFFF"
                    font.pixelSize: parent.height *0.3
                    anchors.top: reception_text.bottom
                }
                }

                Image
                {
                    id: plus_button_image
                    source: "qrc:/ui/Image Main/plus.png"
                    width: parent.width*0.3
                    height: parent.height*0.3
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                        right: parent.right
                        rightMargin: -parent.width*0.05
                    }
                }

                MouseArea
                {
                    id: reception_mouse_area
                    anchors.fill: parent
                    onClicked: console.log("button reception")
                }

                Behavior on color
                {
                    ColorAnimation
                    {
                        duration: 200
                    }
                }
            }

            Rectangle
            {
                Layout.preferredHeight: parent.height/2
                Layout.preferredWidth: parent.width/2.01
                anchors.right: parent.right
                color: activity_mouse_area.pressed?"gray":"#1e1e1e"
                border.color: "black"
                radius: 10

                ColumnLayout
                {
                    id: columnasd
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.1
                        leftMargin: parent.width*0.05
                        bottom: parent.bottom
                    }
                Text
                {
                    id: activity_text
                    text:  "Деятельность"
                    color: "gray"
                    font.pixelSize: parent.height *0.2
                }

                Text
                {
                    text:  "-0 ккал"
                    color: "#FFFFFF"
                    font.pixelSize: parent.height *0.3
                    anchors.top: activity_text.bottom
                }
                }

                Image
                {
                    source: "qrc:/ui/Image Main/plus.png"
                    width: parent.width*0.3
                    height: parent.height*0.3
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                        right: parent.right
                        rightMargin: -parent.width*0.05
                    }

                }

                MouseArea
                {
                    id: activity_mouse_area
                    anchors.fill: parent
                    onClicked: console.log("button activity")
                }

                Behavior on color
                {
                    ColorAnimation
                    {
                        duration: 200
                    }
                }
            }

            Rectangle
            {
                Layout.preferredHeight: parent.height/1.8
                Layout.preferredWidth: parent.width/2.01
                color: drinking_mouse_area.pressed?"gray":"#1e1e1e"
                border.color: "black"
                radius: 10

                ColumnLayout
                {
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.07
                        leftMargin: parent.width*0.05
                        bottom: parent.bottom
                    }
                Text
                {
                    id: drinking_text
                    text:  "Питьевой режим"
                    color: "gray"
                    font.pixelSize: parent.height *0.2
                }

                Text
                {
                    id: drinking_text_two
                    text:  "0 л"
                    color: "#FFFFFF"
                    font.pixelSize: parent.height *0.3
                    anchors.top: drinking_text.bottom
                }

                Text
                {
                    text:  "из 2,88 л"
                    color: "gray"
                    font.pixelSize: parent.height *0.2
                    anchors.top: drinking_text_two.bottom
                }
                }

                Image
                {
                    source: "qrc:/ui/Image Main/plus.png"
                    width: plus_button_image.width
                    height: plus_button_image.height
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                        right: parent.right
                        rightMargin: -parent.width*0.05
                    }

                }

                MouseArea
                {
                    id: drinking_mouse_area
                    anchors.fill: parent
                    onClicked: console.log("button drinking")
                }

                Behavior on color
                {
                    ColorAnimation
                    {
                        duration: 200
                    }
                }
            }

            Rectangle
            {
                id: weight_button
                Layout.preferredHeight: parent.height/1.8
                Layout.preferredWidth: parent.width/2.01
                anchors.right: parent.right
                color: weight_mouse_area.pressed?"gray": "#1e1e1e"
                border.color: "black"
                radius: 10

                ColumnLayout
                {
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.07
                        leftMargin: parent.width*0.05
                        bottom: parent.bottom
                    }

                    Text
                    {
                        id: weight_text
                        text:  "Вес"
                        color: "gray"
                        font.pixelSize: parent.height *0.2
                    }

                    Text
                    {
                        id: weight_text_two
                        text:  "72 кг"
                        color: "#FFFFFF"
                        font.pixelSize: parent.height *0.3
                        anchors.top: weight_text.bottom
                    }

                    Text
                    {
                        text:  "цель: 77 кг"
                        color: "gray"
                        font.pixelSize: parent.height *0.2
                        anchors.top: weight_text_two.bottom
                    }
                }

                Image
                {
                    source: "qrc:/ui/Image Main/plus.png"
                    width: plus_button_image.width
                    height: plus_button_image.height
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                        right: parent.right
                        rightMargin: -parent.width*0.05
                    }

                }

                MouseArea
                {
                    id: weight_mouse_area
                    anchors.fill: parent
                    onClicked: console.log("button weight")
                }

                Behavior on color
                {
                    ColorAnimation
                    {
                        duration: 200
                    }
                }
            }
        }

    ColumnLayout
    {
        anchors
        {
            top: menu_gridlayout.bottom
            topMargin: parent.height*0.1
            left: menu_gridlayout.left
        }
        width: parent.width*0.9
        height: parent.height-menu_gridlayout.height

        RowLayout
        {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height*0.2

            MouseArea
            {
                anchors.fill: parent
                onClicked: console.log("kkal")
            }

            Statistic_object
            {
                id: statistic_object_main
                anchors
                {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
                Layout.preferredWidth: parent.height/1.2
                Layout.preferredHeight: parent.height/1.2
                arcWidth: 6
                outerColor: "orange"
                innerColor: "gray"
                speed: 3500

                Text
                {
                    anchors
                    {
                        verticalCenter:parent.verticalCenter
                        horizontalCenter:parent.horizontalCenter
                    }

                    color: "gray"
                    text: "0%"
                }
            }

            ColumnLayout
            {
                id: statistic_object_columnlayout
                anchors
                {
                left: statistic_object_main.right
                leftMargin: parent.width*0.05
                verticalCenter:parent.verticalCenter
                }
                Layout.preferredHeight: parent.height
                Layout.preferredWidth: parent.horizontalCenter
                Text
                {
                    id: text_one_main_statistic
                    text: "В целом"
                    font.pixelSize: parent.height*0.15
                    color: "lightgray"
                }
                Text
                {
                    id: text_two_main_statistic
                    text: "0 ккал"
                    color: "#FFFFFF"
                    font.pixelSize: parent.height*0.35
                    anchors.top:text_one_main_statistic.bottom
                }
                Text
                {
                    anchors.top:text_two_main_statistic.bottom
                    text: "из 3443 ккал"
                    color: "gray"
                    font.pixelSize: parent.height*0.15
                }
            }

            Image
            {
                anchors
                {
                left: statistic_object_columnlayout.right
                leftMargin: parent.width*0.075
                }
                source: "qrc:/ui/Image Main/info.png"
                Layout.preferredWidth: parent.height/3
                Layout.preferredHeight: parent.height/3
            }

            Image
            {
                anchors
                {
                right: parent.right
                verticalCenter: parent.verticalCenter
                }
                source: "qrc:/ui/Image Main/medal.png"
                Layout.preferredWidth: parent.height/1.2
                Layout.preferredHeight: parent.height/1.2

                MouseArea
                {
                    anchors.fill: parent
                    onClicked: console.log("medal")
                }
            }
        }

        GridLayout
        {
            columns: 2
            rows: 2
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width
            anchors
            {
                horizontalCenter: parent.horizontalCenter
            }

            RowLayout
            {
                id: squirrels_table
                Layout.preferredHeight: parent.height*0.25
                Layout.preferredWidth: parent.width/2.01
                anchors.left: parent.left

                Statistic_object
                {
                    id: object_one
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    Layout.preferredHeight: parent.height/1.2
                    Layout.preferredWidth: parent.height/1.2
                    arcWidth: 6
                    outerColor: "orange"
                    innerColor: "gray"
                    speed: 120

                    Text
                    {
                        anchors
                        {
                            verticalCenter:parent.verticalCenter
                            horizontalCenter:parent.horizontalCenter
                        }

                        color: "gray"
                        text: "0%"
                    }
                }

                Text
                {
                    id: object_one_text1
                    anchors
                    {
                        top: parent.top
                        left: object_one.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.15
                    text: "Белки"
                    color: "lightgray"
                }
                Text
                {
                    id: object_one_text2
                    anchors
                    {
                        left: object_one.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.3
                    text: "0 г"
                    color: "#FFFFFF"
                    anchors.top:object_one_text1.bottom
                }
                Text
                {
                    anchors
                    {
                        left: object_one.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.15
                    text: "из 211 г"
                    color: "gray"
                    anchors.top:object_one_text2.bottom
                }
            }

            RowLayout
            {
                id: carbohydrates_table
                Layout.preferredHeight: parent.height*0.25
                Layout.preferredWidth: parent.width/2.01
                anchors.right: parent.right

                Statistic_object
                {
                    id: object_two
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    Layout.preferredHeight: parent.height/1.2
                    Layout.preferredWidth: parent.height/1.2
                    arcWidth: 6
                    outerColor: "orange"
                    innerColor: "gray"
                    speed: 2200

                    Text
                    {
                        anchors
                        {
                            verticalCenter:parent.verticalCenter
                            horizontalCenter:parent.horizontalCenter
                        }

                        color: "gray"
                        text: "0%"
                    }
                }
                Text
                {
                    id: object_two_text1
                    anchors
                    {
                        top: parent.top
                        left: object_two.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.15
                    text: "Углеводы"
                    color: "lightgray"
                }
                Text
                {
                    id: object_two_text2
                    anchors
                    {
                        left: object_two.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.3
                    text: "0 г"
                    color: "#FFFFFF"
                    anchors.top:object_two_text1.bottom
                }
                Text
                {
                    anchors
                    {
                        left: object_two.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.15
                    text: "из 414 г"
                    color: "gray"
                    anchors.top:object_two_text2.bottom
                }
            }

            RowLayout
            {
                id: fats_table
                Layout.preferredHeight: parent.height*0.25
                Layout.preferredWidth: parent.width/2.01
                anchors
                {
                    top: squirrels_table.bottom
                    topMargin: parent.height*0.05
                    left: parent.left
                }

                Statistic_object
                {
                    id: object_three
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    Layout.preferredHeight: parent.height/1.2
                    Layout.preferredWidth: parent.height/1.2
                    arcWidth: 6
                    outerColor: "orange"
                    innerColor: "gray"
                    speed: 500

                    Text
                    {
                        anchors
                        {
                            verticalCenter:parent.verticalCenter
                            horizontalCenter:parent.horizontalCenter
                        }

                        color: "gray"
                        text: "0%"
                    }
                }
                Text
                {
                    id: object_three_text1
                    anchors
                    {
                        top: parent.top
                        left: object_three.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.15
                    text: "Жиры"
                    color: "lightgray"
                }
                Text
                {
                    id: object_three_text2
                    anchors
                    {
                        left: object_three.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.3
                    text: "0 г"
                    color: "#FFFFFF"
                    anchors.top:object_three_text1.bottom
                }
                Text
                {
                    anchors
                    {
                        left: object_three.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.15
                    text: "из 95,8 г"
                    color: "gray"
                    anchors.top:object_three_text2.bottom
                }
            }

            RowLayout
            {
                id: cellulose_table
                Layout.preferredHeight: parent.height*0.25
                Layout.preferredWidth: parent.width/2.01
                anchors
                {
                    top: carbohydrates_table.bottom
                    topMargin: parent.height*0.05
                    right: parent.right
                }

                Statistic_object
                {
                    id: object_four
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    Layout.preferredHeight: parent.height/1.2
                    Layout.preferredWidth: parent.height/1.2
                    arcWidth: 6
                    outerColor: "orange"
                    innerColor: "gray"
                    speed: 1000

                    Text
                    {
                        anchors
                        {
                            verticalCenter:parent.verticalCenter
                            horizontalCenter:parent.horizontalCenter
                        }

                        color: "gray"
                        text: "0%"
                    }
                }

                Text
                {
                    id: object_four_text1
                    anchors
                    {
                        top: parent.top
                        left: object_four.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.15
                    text: "Клетчатка"
                    color: "lightgray"
                }
                Text
                {
                    id: object_four_text2
                    anchors
                    {
                        left: object_four.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.3
                    text: "0 г"
                    color: "#FFFFFF"
                    anchors.top:object_four_text1.bottom
                }
                Text
                {
                    anchors
                    {
                        left: object_four.right
                        leftMargin: parent.width*0.1
                    }
                    font.pixelSize: parent.height*0.15
                    text: "из 27,5 г"
                    color: "gray"
                    anchors.top:object_four_text2.bottom
                }
            }
        }
    }
}
