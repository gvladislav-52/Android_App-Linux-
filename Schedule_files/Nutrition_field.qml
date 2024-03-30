import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

Item
{
    property var meal_schedule_static:
    [
        "ЗАВТРАК",
        "ВТОРОЙ ЗАВТРАК",
        "ОБЕД",
        "ПОЛДНИК",
        "УЖИН",
        "ВТОРОЙ УЖИН",
    ]
    id: track
    anchors.fill: parent

    ScrollView
    {
        anchors.fill: parent
        clip: true
        ScrollBar.vertical.policy: ScrollBar.AlwaysOff
        contentHeight: lol.height

    ColumnLayout {
        id: lol
        width: parent.width *0.9
        anchors
        {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        }

                Rectangle {
                    id: tect
                    Layout.preferredHeight: Math.max(sfa.model * track.height*0.05 + 30)
                    Layout.preferredWidth: parent.width
                    color: "transparent"

                    Rectangle
                    {
                        id: name_schedule
                        width: parent.width
                        height: track.height * 0.07
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#1e1e1e"
                        radius: 10

                        RowLayout {
                                                id: test_rowlayout
                                                anchors.fill: parent

                                                Text
                                                {
                                                    text: meal_schedule_static[0]
                                                    font.pixelSize: parent.height * 0.4
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                                    Layout.leftMargin: parent.width * 0.03
                                                    Layout.fillWidth: true
                                                }

                                                Text
                                                {
                                                    text: "2232 ккал."
                                                    font.pixelSize: parent.height*0.3
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    id: dot_image
                                                    source: "qrc:/ui/Image Main/dot.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    id: plus_image
                                                    source: "qrc:/ui/Image Main/plus.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.margins: parent.width * 0.02

                                                    MouseArea
                                                    {
                                                        anchors.fill: parent
                                                        onClicked:
                                                        {
                                                            foods_menu.visible = true
                                                            foods_menu.enabled = true
                                                            schedule_temp.visible = false
                                                            schedule_temp.enabled = false
                                                        }
                                                    }
                                                }
                                            }
                     }

                    clip: true

                    ColumnLayout {
                        anchors
                        {
                            top: name_schedule.bottom
                            topMargin: parent.height*0.02
                            horizontalCenter: parent.horizontalCenter

                        }
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width
                                    Repeater {
                                        id: sfa

                                        model: Table_food.Breakfast.length


                                        RowLayout {
                                            Layout.preferredHeight: track.height * 0.025
                                            Layout.preferredWidth:track.width*0.8

                                            Text {
                                                id: poprob
                                                Layout.alignment: Qt.AlignLeft
                                                text: Table_food.Breakfast[index]
                                                font.pixelSize: track.height * 0.025
                                                color: "#FFFFFF"
                                                Layout.fillWidth: true
                                            }

                                            Text
                                            {
                                                text: "186 ккал."
                                                Layout.alignment: Qt.AlignRight
                                                Layout.rightMargin: parent.width *0.1
                                                font.pixelSize: track.height * 0.02
                                                color: "lightgray"
                                            }

                                            Image
                                            {
                                                id: sas
                                                Layout.alignment: Qt.AlignRight
                                                source: "qrc:/ui/Image Main/cancel.jpg"
                                                Layout.preferredHeight: track.height * 0.025
                                                Layout.preferredWidth: track.height * 0.025
                                                MouseArea
                                                {
                                                    anchors.fill: parent
                                                    onClicked:
                                                    {
                                                        if(db.delete_data(index,"BREAKFAST",Deitary_temp.Data_temp))
                                                            Table_food.remove_breakfast(index)
                                                    }
                                                }
                                            }
                                        }
                                    }
                    }
                }

                Rectangle {
                    Layout.preferredHeight: Math.max(sfa1.model * track.height*0.05 + 30)
                    Layout.preferredWidth: parent.width
                    color: "transparent"

                    Rectangle
                    {
                        id: name_schedule1
                        width: parent.width
                        height: track.height * 0.07
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#1e1e1e"
                        radius: 10

                        RowLayout {
                                                anchors.fill: parent

                                                Text
                                                {
                                                    text: meal_schedule_static[1]
                                                    font.pixelSize: parent.height * 0.4
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                                    Layout.leftMargin: parent.width * 0.03
                                                    Layout.fillWidth: true
                                                }

                                                Text
                                                {
                                                    text: "2232 ккал."
                                                    font.pixelSize: parent.height*0.3
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/dot.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/plus.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.margins: parent.width * 0.02

                                                    MouseArea
                                                    {
                                                        anchors.fill: parent
                                                        onClicked:
                                                        {
                                                            foods_menu.visible = true
                                                            foods_menu.enabled = true
                                                            schedule_temp.visible = false
                                                            schedule_temp.enabled = false
                                                        }
                                                    }
                                                }
                                            }
                     }

                    clip: true

                    ColumnLayout {
                        anchors
                        {
                            top: name_schedule1.bottom
                            topMargin: parent.height*0.02
                            horizontalCenter: parent.horizontalCenter

                        }
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width
                                    Repeater {
                                        id: sfa1

                                        model: Table_food.Second_breakfast.length


                                        RowLayout {
                                            Layout.preferredHeight: track.height * 0.025
                                            Layout.preferredWidth:track.width*0.8

                                            Text {
                                                Layout.alignment: Qt.AlignLeft
                                                text: Table_food.Second_breakfast[index]
                                                font.pixelSize: track.height * 0.025
                                                color: "#FFFFFF"
                                                Layout.fillWidth: true
                                            }

                                            Text
                                            {
                                                text: "186 ккал."
                                                Layout.alignment: Qt.AlignRight
                                                Layout.rightMargin: parent.width *0.1
                                                font.pixelSize: track.height * 0.02
                                                color: "lightgray"
                                            }

                                            Image
                                            {
                                                Layout.alignment: Qt.AlignRight
                                                source: "qrc:/ui/Image Main/cancel.jpg"
                                                Layout.preferredHeight: track.height * 0.025
                                                Layout.preferredWidth: track.height * 0.025
                                                MouseArea
                                                {
                                                    anchors.fill: parent
                                                    onClicked:
                                                    {
                                                        if(db.delete_data(index,"SECOND BREAKFAST",Deitary_temp.Data_temp))
                                                            Table_food.remove_sec_breakfast(index)
                                                    }
                                                }
                                            }
                                        }
                                    }
                    }
                }

                Rectangle {
                    Layout.preferredHeight: Math.max(sfa2.model * track.height*0.05 + 30)
                    Layout.preferredWidth: parent.width
                    color: "transparent"

                    Rectangle
                    {
                        id: name_schedule2
                        width: parent.width
                        height: track.height * 0.07
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#1e1e1e"
                        radius: 10

                        RowLayout {
                                                anchors.fill: parent

                                                Text
                                                {
                                                    text: meal_schedule_static[2]
                                                    font.pixelSize: parent.height * 0.4
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                                    Layout.leftMargin: parent.width * 0.03
                                                    Layout.fillWidth: true
                                                }

                                                Text
                                                {
                                                    text: "2232 ккал."
                                                    font.pixelSize: parent.height*0.3
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/dot.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/plus.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.margins: parent.width * 0.02

                                                    MouseArea
                                                    {
                                                        anchors.fill: parent
                                                        onClicked:
                                                        {
                                                            foods_menu.visible = true
                                                            foods_menu.enabled = true
                                                            schedule_temp.visible = false
                                                            schedule_temp.enabled = false
                                                        }
                                                    }
                                                }
                                            }
                     }

                    clip: true

                    ColumnLayout {
                        anchors
                        {
                            top: name_schedule2.bottom
                            topMargin: parent.height*0.02
                            horizontalCenter: parent.horizontalCenter

                        }
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width
                                    Repeater {
                                        id: sfa2

                                        model: Table_food.Lunch.length


                                        RowLayout {
                                            Layout.preferredHeight: track.height * 0.025
                                            Layout.preferredWidth:track.width*0.8

                                            Text {
                                                Layout.alignment: Qt.AlignLeft
                                                text: Table_food.Lunch[index]
                                                font.pixelSize: track.height * 0.025
                                                color: "#FFFFFF"
                                                Layout.fillWidth: true
                                            }

                                            Text
                                            {
                                                text: "186 ккал."
                                                Layout.alignment: Qt.AlignRight
                                                Layout.rightMargin: parent.width *0.1
                                                font.pixelSize: track.height * 0.02
                                                color: "lightgray"
                                            }

                                            Image
                                            {
                                                Layout.alignment: Qt.AlignRight
                                                source: "qrc:/ui/Image Main/cancel.jpg"
                                                Layout.preferredHeight: track.height * 0.025
                                                Layout.preferredWidth: track.height * 0.025
                                                MouseArea
                                                {
                                                    anchors.fill: parent
                                                    onClicked:
                                                    {
                                                        if(db.delete_data(index,"LUNCH",Deitary_temp.Data_temp))
                                                            Table_food.remove_lunch(index)
                                                    }
                                                }
                                            }
                                        }
                                    }
                    }
                }

                Rectangle {
                    Layout.preferredHeight: Math.max(sfa3.model * track.height*0.05 + 30)
                    Layout.preferredWidth: parent.width
                    color: "transparent"

                    Rectangle
                    {
                        id: name_schedule3
                        width: parent.width
                        height: track.height * 0.07
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#1e1e1e"
                        radius: 10

                        RowLayout {
                                                anchors.fill: parent

                                                Text
                                                {
                                                    text: meal_schedule_static[3]
                                                    font.pixelSize: parent.height * 0.4
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                                    Layout.leftMargin: parent.width * 0.03
                                                    Layout.fillWidth: true
                                                }

                                                Text
                                                {
                                                    text: "2232 ккал."
                                                    font.pixelSize: parent.height*0.3
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/dot.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/plus.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.margins: parent.width * 0.02

                                                    MouseArea
                                                    {
                                                        anchors.fill: parent
                                                        onClicked:
                                                        {
                                                            foods_menu.visible = true
                                                            foods_menu.enabled = true
                                                            schedule_temp.visible = false
                                                            schedule_temp.enabled = false
                                                        }
                                                    }
                                                }
                                            }
                     }

                    clip: true

                    ColumnLayout {
                        anchors
                        {
                            top: name_schedule3.bottom
                            topMargin: parent.height*0.02
                            horizontalCenter: parent.horizontalCenter

                        }
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width
                                    Repeater {
                                        id: sfa3

                                        model: Table_food.Afternoon.length


                                        RowLayout {
                                            Layout.preferredHeight: track.height * 0.025
                                            Layout.preferredWidth:track.width*0.8

                                            Text {
                                                Layout.alignment: Qt.AlignLeft
                                                text: Table_food.Afternoon[index]
                                                font.pixelSize: track.height * 0.025
                                                color: "#FFFFFF"
                                                Layout.fillWidth: true
                                            }

                                            Text
                                            {
                                                text: "186 ккал."
                                                Layout.alignment: Qt.AlignRight
                                                Layout.rightMargin: parent.width *0.1
                                                font.pixelSize: track.height * 0.02
                                                color: "lightgray"
                                            }

                                            Image
                                            {
                                                Layout.alignment: Qt.AlignRight
                                                source: "qrc:/ui/Image Main/cancel.jpg"
                                                Layout.preferredHeight: track.height * 0.025
                                                Layout.preferredWidth: track.height * 0.025
                                                MouseArea
                                                {
                                                    anchors.fill: parent
                                                    onClicked:
                                                    {
                                                        if(db.delete_data(index,"AFTERNOON SNACK",Deitary_temp.Data_temp))
                                                            Table_food.remove_afternoon(index)
                                                    }
                                                }
                                            }
                                        }
                                    }
                    }
                }

                Rectangle {
                    Layout.preferredHeight: Math.max(sfa4.model * track.height*0.05 + 30)
                    Layout.preferredWidth: parent.width
                    color: "transparent"

                    Rectangle
                    {
                        id: name_schedule4
                        width: parent.width
                        height: track.height * 0.07
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#1e1e1e"
                        radius: 10

                        RowLayout {
                                                anchors.fill: parent

                                                Text
                                                {
                                                    text: meal_schedule_static[4]
                                                    font.pixelSize: parent.height * 0.4
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                                    Layout.leftMargin: parent.width * 0.03
                                                    Layout.fillWidth: true
                                                }

                                                Text
                                                {
                                                    text: "2232 ккал."
                                                    font.pixelSize: parent.height*0.3
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/dot.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/plus.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.margins: parent.width * 0.02

                                                    MouseArea
                                                    {
                                                        anchors.fill: parent
                                                        onClicked:
                                                        {
                                                            foods_menu.visible = true
                                                            foods_menu.enabled = true
                                                            schedule_temp.visible = false
                                                            schedule_temp.enabled = false
                                                        }
                                                    }
                                                }
                                            }
                     }

                    clip: true

                    ColumnLayout {
                        anchors
                        {
                            top: name_schedule4.bottom
                            topMargin: parent.height*0.02
                            horizontalCenter: parent.horizontalCenter

                        }
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width
                                    Repeater {
                                        id: sfa4

                                        model: Table_food.Dinner.length


                                        RowLayout {
                                            Layout.preferredHeight: track.height * 0.025
                                            Layout.preferredWidth:track.width*0.8

                                            Text {
                                                Layout.alignment: Qt.AlignLeft
                                                text: Table_food.Dinner[index]
                                                font.pixelSize: track.height * 0.025
                                                color: "#FFFFFF"
                                                Layout.fillWidth: true
                                            }

                                            Text
                                            {
                                                text: "186 ккал."
                                                Layout.alignment: Qt.AlignRight
                                                Layout.rightMargin: parent.width *0.1
                                                font.pixelSize: track.height * 0.02
                                                color: "lightgray"
                                            }

                                            Image
                                            {
                                                Layout.alignment: Qt.AlignRight
                                                source: "qrc:/ui/Image Main/cancel.jpg"
                                                Layout.preferredHeight: track.height * 0.025
                                                Layout.preferredWidth: track.height * 0.025
                                                MouseArea
                                                {
                                                    anchors.fill: parent
                                                    onClicked:
                                                    {
                                                        if(db.delete_data(index,"DINNER",Deitary_temp.Data_temp))
                                                            Table_food.remove_dinner(index)
                                                    }
                                                }
                                            }
                                        }
                                    }
                    }
                }

                Rectangle {
                    Layout.preferredHeight: Math.max(sfa5.model * track.height*0.05 + 30)
                    Layout.preferredWidth: parent.width
                    color: "transparent"

                    Rectangle
                    {
                        id: name_schedule5
                        width: parent.width
                        height: track.height * 0.07
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#1e1e1e"
                        radius: 10

                        RowLayout {
                                                anchors.fill: parent

                                                Text
                                                {
                                                    text: meal_schedule_static[5]
                                                    font.pixelSize: parent.height * 0.4
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                                    Layout.leftMargin: parent.width * 0.03
                                                    Layout.fillWidth: true
                                                }

                                                Text
                                                {
                                                    text: "2232 ккал."
                                                    font.pixelSize: parent.height*0.3
                                                    color: "gray"
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/dot.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.rightMargin: parent.width * 0.03
                                                }

                                                Image
                                                {
                                                    source: "qrc:/ui/Image Main/plus.png"
                                                    Layout.preferredHeight: parent.height * 0.6
                                                    Layout.preferredWidth: parent.height * 0.6
                                                    smooth: true
                                                    fillMode: Image.PreserveAspectFit
                                                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                                    Layout.margins: parent.width * 0.02

                                                    MouseArea
                                                    {
                                                        anchors.fill: parent
                                                        onClicked:
                                                        {
                                                            foods_menu.visible = true
                                                            foods_menu.enabled = true
                                                            schedule_temp.visible = false
                                                            schedule_temp.enabled = false
                                                        }
                                                    }
                                                }
                                            }
                     }

                    clip: true

                    ColumnLayout {
                        anchors
                        {
                            top: name_schedule5.bottom
                            topMargin: parent.height*0.02
                            horizontalCenter: parent.horizontalCenter

                        }
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width
                                    Repeater {
                                        id: sfa5

                                        model: Table_food.Second_dinner.length


                                        RowLayout {
                                            Layout.preferredHeight: track.height * 0.025
                                            Layout.preferredWidth:track.width*0.8

                                            Text {
                                                Layout.alignment: Qt.AlignLeft
                                                text: Table_food.Second_dinner[index]
                                                font.pixelSize: track.height * 0.025
                                                color: "#FFFFFF"
                                                Layout.fillWidth: true
                                            }

                                            Text
                                            {
                                                text: "186 ккал."
                                                Layout.alignment: Qt.AlignRight
                                                Layout.rightMargin: parent.width *0.1
                                                font.pixelSize: track.height * 0.02
                                                color: "lightgray"
                                            }

                                            Image
                                            {
                                                Layout.alignment: Qt.AlignRight
                                                source: "qrc:/ui/Image Main/cancel.jpg"
                                                Layout.preferredHeight: track.height * 0.025
                                                Layout.preferredWidth: track.height * 0.025
                                                MouseArea
                                                {
                                                    anchors.fill: parent
                                                    onClicked:
                                                    {
                                                        if(db.delete_data(index,"SECOND DINNER",Deitary_temp.Data_temp))
                                                            Table_food.remove_sec_dinner(index)
                                                    }
                                                }
                                            }
                                        }
                                    }
                    }
                }

            Repeater {
                id: test
                model: 0

                RowLayout {
                    Layout.preferredHeight: track.height* 0.07
                    Layout.preferredWidth: parent.width

                    Text
                    {
                        text: Deitary_temp.note_string[index]
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
            Item
            {
                Layout.preferredHeight: track.height* 0.1
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
                    height: parent.height * 0.4
                    width: parent.height * 0.4
                }

                Text
                {
                    text: "Добавить заметку"
                    anchors
                    {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                    color: "gray"
                    font.pixelSize: parent.height * 0.3
                }

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        Deitary_temp.add_note_string()
                        test.model = test.model+1
                    }
                }
            }
        }
    }
}
