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
                    spacing: 0
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.1
                        leftMargin: parent.width*0.05
                        bottom: parent.bottom
                        bottomMargin: parent.height * 0.1
                    }
                Text
                {
                    id: reception_text
                    text:  "Прием"
                    color: "gray"
                    font.pixelSize: parent.height *0.2
                    Layout.alignment: Qt.AlignTop
                }

                Text
                {
                    text:  "0 ккал"
                    color: "#FFFFFF"
                    font.pixelSize: parent.height *0.3
                    //anchors.top: reception_text.bottom
                    Layout.alignment: Qt.AlignTop
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
                    onClicked:
                    {
                        foods_menu.visible = true
                        foods_menu.enabled = true
                        schedule_temp.visible = false
                        schedule_temp.enabled = false
                    }
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
                Layout.alignment: Qt.AlignRight
                //anchors.right: parent.right
                color: activity_mouse_area.pressed?"gray":"#1e1e1e"
                border.color: "black"
                radius: 10

                ColumnLayout
                {
                    spacing: 0
                    id: columnasd
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.1
                        leftMargin: parent.width*0.05
                        bottom: parent.bottom
                        bottomMargin: parent.height * 0.1
                    }
                Text
                {
                    id: activity_text
                    text:  "Деятельность"
                    color: "gray"
                    font.pixelSize: parent.height *0.2
                    Layout.alignment: Qt.AlignTop
                }

                Text
                {
                    text:  "-0 ккал"
                    color: "#FFFFFF"
                    font.pixelSize: parent.height *0.3
                    //anchors.top: activity_text.btom
                    Layout.alignment: Qt.AlignTop
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
                    spacing: 0
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.07
                        leftMargin: parent.width*0.05
                        bottom: parent.bottom
                        bottomMargin: parent.height * 0.1
                    }
                Text
                {
                    id: drinking_text
                    text:  "Питьевой режим"
                    color: "gray"
                    font.pixelSize: parent.height *0.2
                    Layout.alignment: Qt.AlignTop
                }

                Text
                {
                    id: drinking_text_two
                    text:  "0 л"
                    color: "#FFFFFF"
                    font.pixelSize: parent.height *0.3
                    //anchors.top: drinking_text.bottom
                }

                Text
                {
                    text:  Main_logic_temp.Drinking_regime + " л"
                    color: "gray"
                    font.pixelSize: parent.height *0.2
                    //anchors.top: drinking_text_two.bottom
                    Layout.alignment: Qt.AlignBottom
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
                    onClicked:
                    {
                        console.log("drink");
                    }
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
                Layout.alignment: Qt.AlignRight
                color: weight_mouse_area.pressed?"gray": "#1e1e1e"
                border.color: "black"
                radius: 10

                ColumnLayout
                {
                    spacing: 0
                    anchors
                    {
                        top: parent.top
                        left: parent.left
                        topMargin: parent.height *0.07
                        leftMargin: parent.width*0.05
                        bottom: parent.bottom
                        bottomMargin: parent.height*0.1
                    }
                    Text
                    {
                        id: weight_text
                        text:  "Вес"
                        color: "gray"
                        font.pixelSize: parent.height *0.2
                        Layout.alignment: Qt.AlignTop
                    }

                    Text
                    {
                        id: weight_text_two
                        text:  Main_logic_temp.Actual_weight + " кг"
                        color: "#FFFFFF"
                        font.pixelSize: parent.height *0.3
                    }

                    Text
                    {
                        text:  "цель: " + Main_logic_temp.Target_weight + " кг"
                        color: "gray"
                        font.pixelSize: parent.height *0.2
                        Layout.alignment: Qt.AlignBottom
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

        Item
        {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height*0.2

            MouseArea
            {
                anchors.fill: parent
                onClicked: console.log("kkal")
            }

            Statistic_object {
                id: statistic_object_main
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
                width: parent.height / 1.2
                height: parent.height / 1.2
                arcWidth: 6
                outerColor: "orange"
                innerColor: "gray"
                speed: parseFloat(Deitary_temp.Calories_day_temp).toFixed(1)
                highestRange: Main_logic_temp.Target_metabolism

                Text {
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    font.pixelSize: parent.height * 0.2
                    color: "gray"
                    text: (parseFloat(statistic_object_main.speed/statistic_object_main.highestRange * 100)).toFixed(0) + "%"
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
                height: parent.height*0.9
                width: text_two_main_statistic.width
                spacing: 0
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
                    text: parseFloat(Deitary_temp.Calories_day_temp).toFixed(1) + " ккал"
                    color: "#FFFFFF"
                    font.pixelSize: parent.height*0.3
                }
                Text
                {
                    text: "из "+ Main_logic_temp.Target_metabolism +" ккал"
                    color: "gray"
                    font.pixelSize: parent.height*0.15
                }
            }

            Image
            {
                anchors
                {
                left: statistic_object_columnlayout.right
                leftMargin: parent.width*0.05
                verticalCenter: parent.verticalCenter
                }
                source: "qrc:/ui/Image Main/info.png"
                width: parent.height/3
                height: parent.height/3
            }

            Image
            {
                anchors
                {
                right: parent.right
                verticalCenter: parent.verticalCenter
                }
                source: "qrc:/ui/Image Main/medal.png"
                width: parent.height/1.2
                height: parent.height/1.2

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
            Layout.alignment: Qt.AlignHCenter

            Item
            {
                id: squirrels_table
                Layout.preferredHeight: parent.height*0.25
                Layout.preferredWidth: parent.width/2.01
                Layout.alignment: Qt.AlignLeft

                Statistic_object
                {
                    id: object_one
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    height: parent.height/1.2
                    width: parent.height/1.2
                    arcWidth: 6
                    outerColor: "orange"
                    innerColor: "gray"
                    speed: parseFloat(Deitary_temp.Protein_day_temp).toFixed(1)
                    highestRange: Main_logic_temp.Protein

                    Text
                    {
                        anchors
                        {
                            verticalCenter:parent.verticalCenter
                            horizontalCenter:parent.horizontalCenter
                        }
                        font.pixelSize: parent.height * 0.2
                        color: "gray"
                        text: (parseFloat(object_one.speed/object_one.highestRange * 100)).toFixed(0) + "%"
                    }
                }

                Text
                {
                    id: object_one_text1
                    anchors
                    {
                        top: parent.top
                        topMargin: parent.height * 0.1
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
                    font.pixelSize: parent.height*0.25
                    text: parseFloat(Deitary_temp.Protein_day_temp).toFixed(1) + " г"
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
                    text: "из "+ Main_logic_temp.Protein +" г"
                    color: "gray"
                    anchors.top:object_one_text2.bottom
                }
            }

            Item
            {
                id: carbohydrates_table
                Layout.preferredHeight: parent.height*0.25
                Layout.preferredWidth: parent.width/2.01
                Layout.alignment: Qt.AlignRight
                Statistic_object
                {
                    id: object_two
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    height: parent.height/1.2
                    width: parent.height/1.2
                    arcWidth: 6
                    outerColor: "orange"
                    innerColor: "gray"
                    speed: parseFloat(Deitary_temp.Carb_day_temp).toFixed(1)
                    highestRange: Main_logic_temp.Carb
                    Text
                    {
                        anchors
                        {
                            verticalCenter:parent.verticalCenter
                            horizontalCenter:parent.horizontalCenter
                        }

                        font.pixelSize: parent.height * 0.2
                        color: "gray"
                        text: (parseFloat(object_two.speed/object_two.highestRange * 100)).toFixed(0) + "%"
                    }
                }
                Text
                {
                    id: object_two_text1
                    anchors
                    {
                        top: parent.top
                        topMargin: parent.height * 0.1
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
                    font.pixelSize: parent.height*0.25
                    text: parseFloat(Deitary_temp.Carb_day_temp).toFixed(1) + " г"
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
                    text: "из "+ Main_logic_temp.Carb +" г"
                    color: "gray"
                    anchors.top:object_two_text2.bottom
                }
            }

            Item
            {
                id: fats_table
                Layout.preferredHeight: parent.height*0.25
                Layout.preferredWidth: parent.width/2.01
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                Statistic_object
                {
                    id: object_three
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    height: parent.height/1.2
                    width: parent.height/1.2
                    arcWidth: 6
                    outerColor: "orange"
                    innerColor: "gray"
                    speed: parseFloat(Deitary_temp.Fats_day_temp).toFixed(1)
                    highestRange: Main_logic_temp.Fats

                    Text
                    {
                        anchors
                        {
                            verticalCenter:parent.verticalCenter
                            horizontalCenter:parent.horizontalCenter
                        }

                        font.pixelSize: parent.height * 0.2
                        color: "gray"
                        text: (parseFloat(object_three.speed/object_three.highestRange * 100)).toFixed(0) + "%"
                    }
                }
                Text
                {
                    id: object_three_text1
                    anchors
                    {
                        top: parent.top
                        topMargin: parent.height*0.1
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
                    font.pixelSize: parent.height*0.25
                    text: parseFloat(Deitary_temp.Fats_day_temp).toFixed(1) + " г"
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
                    text: "из " + Main_logic_temp.Fats +" г"
                    color: "gray"
                    anchors.top:object_three_text2.bottom
                }
            }

            Item
            {
                id: cellulose_table
                Layout.preferredHeight: parent.height*0.25
                Layout.preferredWidth: parent.width/2.01
                Layout.alignment: Qt.AlignRight| Qt.AlignTop

                Statistic_object
                {
                    id: object_four
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    height: parent.height/1.2
                    width: parent.height/1.2
                    arcWidth: 6
                    outerColor: "orange"
                    innerColor: "gray"
                    speed: parseFloat(Deitary_temp.Fiber_day_temp).toFixed(1)
                    highestRange: Main_logic_temp.Fiber

                    Text
                    {
                        anchors
                        {
                            verticalCenter:parent.verticalCenter
                            horizontalCenter:parent.horizontalCenter
                        }

                        font.pixelSize: parent.height * 0.2
                        color: "gray"
                        text:
                        {
                            (parseFloat(object_four.speed/object_four.highestRange * 100)).toFixed(0) + "%"
                        }
                    }
                }

                Text
                {
                    id: object_four_text1
                    anchors
                    {
                        top: parent.top
                        topMargin: parent.height * 0.1
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
                    font.pixelSize: parent.height*0.25
                    text: parseFloat(Deitary_temp.Fiber_day_temp).toFixed(1) + " г"
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
                    text: "из " + Main_logic_temp.Fiber + " г"
                    color: "gray"
                    anchors.top:object_four_text2.bottom
                }
            }
        }
    }
}
