import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: "#121212"
    property variant index_temp

    function updatePaint()
    {
        canvas.requestPaint()
    }

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
                text: "Подробности продукта"
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
                    view_composition_foods_.visible = false
                    view_composition_foods_.enabled = false
                    view_foods_item.visible = true
                    view_foods_item.enabled = true
                }
            }
        }
    }

    ColumnLayout
    {
        anchors
        {
            top: headerfoods.bottom
            topMargin: parent.height * 0.035
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width * 0.95
        height: parent.height - headerfoods.height

    Rectangle
    {
        id: foods_name
        color: "#1e1e1e"
        Layout.fillWidth: true
        Layout.preferredHeight: parent.height * 0.2
        Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
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
            font.pixelSize: parent.height * 0.075
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
                font.pixelSize: parent.height * 0.1
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
                    font.pixelSize: parent.height * 0.7
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
                    font.pixelSize: parent.height * 0.7
                }
            }
        }
    }

    Rectangle
    {
        Layout.fillWidth: true
        Layout.preferredHeight: parent.height * 0.65
        Layout.alignment:  Qt.AlignHCenter
        color: "#1e1e1e"
        border.color: "black"
        radius: parent.height * 0.02

        ColumnLayout
        {
            anchors.fill: parent
        Rectangle
        {
            id: table_info
            color: "#1e1e1e"
            Layout.preferredWidth: parent.width * 0.9
            Layout.preferredHeight: parent.height * 0.45
            Layout.alignment:  Qt.AlignHCenter

            ColumnLayout
            {
                anchors.fill: parent
                spacing: parent.height * 0.05

                Item {
                    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height * 0.3

                    Text
                    {
                        text: "Энергия"
                        color: "gray"
                        font.pixelSize: parent.height * 0.3
                        anchors
                        {
                            top: parent.top
                            horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Text
                    {
                        text: Table_food.Data_food[(index_temp*6)] +" ккал."
                        color: "white"
                        font.pixelSize: parent.height * 0.4
                        anchors
                        {
                            top: parent.verticalCenter
                            horizontalCenter: parent.horizontalCenter
                        }
                    }

                    Rectangle
                    {
                        anchors
                        {
                            horizontalCenter: parent.horizontalCenter
                            top: parent.bottom
                        }

                        color: "gray"
                        height: parent.height * 0.025
                        width: parent.width
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height * 0.3

                    Item {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Layout.preferredWidth: parent.width*0.5
                        Layout.preferredHeight: parent.height
                        Text
                        {
                            text: "Белки"
                            color: "gray"
                            font.pixelSize: parent.height * 0.3
                            anchors
                            {
                                top: parent.top
                                horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Text
                        {
                            text: Table_food.Data_food[(index_temp*6)+4] +" г"
                            color: "white"
                            font.pixelSize: parent.height * 0.3
                            anchors
                            {
                                top: parent.verticalCenter
                                horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Rectangle
                        {
                            anchors
                            {
                                horizontalCenter: parent.horizontalCenter
                                top: parent.bottom
                            }

                            color: "gray"
                            height: parent.height * 0.02
                            width: parent.width
                        }
                    }

                    Item {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Layout.preferredWidth: parent.width*0.5
                        Layout.preferredHeight: parent.height
                        Text
                        {
                            text: "Углеводы"
                            color: "gray"
                            font.pixelSize: parent.height * 0.3
                            anchors
                            {
                                top: parent.top
                                horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Text
                        {
                            text: Table_food.Data_food[(index_temp*6)+1] +" г"
                            color: "white"
                            font.pixelSize: parent.height * 0.3
                            anchors
                            {
                                top: parent.verticalCenter
                                horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Rectangle
                        {
                            anchors
                            {
                                horizontalCenter: parent.horizontalCenter
                                top: parent.bottom
                            }

                            color: "gray"
                            height: parent.height * 0.02
                            width: parent.width
                        }
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height * 0.3

                    Item {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Layout.preferredWidth: parent.width*0.5
                        Layout.preferredHeight: parent.height
                        Text
                        {
                            text: "Жиры"
                            color: "gray"
                            font.pixelSize: parent.height * 0.3
                            anchors
                            {
                                top: parent.top
                                horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Text
                        {
                            text: Table_food.Data_food[(index_temp*6)+2] +" г"
                            color: "white"
                            font.pixelSize: parent.height * 0.3
                            anchors
                            {
                                top: parent.verticalCenter
                                horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Rectangle
                        {
                            anchors
                            {
                                horizontalCenter: parent.horizontalCenter
                                top: parent.bottom
                            }

                            color: "gray"
                            height: parent.height * 0.02
                            width: parent.width
                        }
                    }

                    Item {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Layout.preferredWidth: parent.width*0.5
                        Layout.preferredHeight: parent.height
                        Text
                        {
                            text: "Клетчатка"
                            color: "gray"
                            font.pixelSize: parent.height * 0.3
                            anchors
                            {
                                top: parent.top
                                horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Text
                        {
                            text: Table_food.Data_food[(index_temp*6)+3] +" г"
                            color: "white"
                            font.pixelSize: parent.height * 0.3
                            anchors
                            {
                                top: parent.verticalCenter
                                horizontalCenter: parent.horizontalCenter
                            }
                        }

                        Rectangle
                        {
                            anchors
                            {
                                horizontalCenter: parent.horizontalCenter
                                top: parent.bottom
                            }

                            color: "gray"
                            height: parent.height * 0.02
                            width: parent.width
                        }
                    }
                }
            }
        }

        Rectangle
        {
            color: "#1e1e1e"
            Layout.preferredWidth: parent.width * 0.9
            Layout.preferredHeight: parent.height * 0.45
            Layout.alignment:  Qt.AlignHCenter

            RowLayout {
                anchors.fill: parent

                Canvas {
                    id: canvas
                    Layout.preferredWidth: parent.height * 0.8
                    Layout.preferredHeight: parent.height * 0.8
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    property variant sum
                    property variant data: [Table_food.Data_food[(index_temp*6)+4], Table_food.Data_food[(index_temp*6)+1], Table_food.Data_food[(index_temp*6)+2],Table_food.Data_food[(index_temp*6)+3]]
                    function drawChart() {
                        var ctx = getContext("2d");
                        if (ctx === null) {
                            console.log("Error canvas paint");
                            return;
                        }

                        sum = data[0] + data[1] + data[2] + data[3];
                        var total = data.reduce(function(acc, val) {
                            return acc + val;
                        }, 0);

                        var startPoint = 0;
                        var colors = ["red", "blue", "yellow","green"];

                        for (var i = 0; i < data.length; i++) {
                            var angle = 2 * Math.PI * (data[i] / total);
                            ctx.beginPath();
                            ctx.moveTo(canvas.width / 2, canvas.height / 2);
                            ctx.arc(canvas.width / 2, canvas.height / 2, canvas.width / 2, startPoint, startPoint + angle);
                            ctx.closePath();
                            ctx.fillStyle = colors[i];
                            ctx.fill();
                            startPoint += angle;
                        }
                        ctx.beginPath();
                        ctx.arc(canvas.width / 2, canvas.height / 2, canvas.width / 4, 0, 2 * Math.PI);
                        ctx.fillStyle = "#1e1e1e";
                        ctx.fill();
                        ctx.closePath();
                    }

                    onPaint: {
                        drawChart();
                    }
                }

            ColumnLayout
            {
                Layout.preferredWidth: parent.width* 0.5
                Layout.preferredHeight: parent.height*0.8
                Layout.alignment: Qt.AlignRight| Qt.AlignVCenter

                RowLayout
                {
                    Layout.preferredWidth: parent.width * 0.9
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.alignment: Qt.AlignHCenter

                    Rectangle
                    {
                        Layout.preferredHeight: parent.height * 0.3
                        Layout.preferredWidth: parent.height * 0.3
                        radius: parent.height * 0.2
                        color: "red"
                        Layout.alignment: Qt.AlignLeft| Qt.AlignVCenter
                    }

                    Text
                    {
                        text: "Белки"
                        font.pixelSize: parent.height * 0.3
                        color: "gray"
                        Layout.alignment: Qt.AlignLeft| Qt.AlignVCenter
                    }

                    Text
                    {
                        text: parseFloat((canvas.data[0]/canvas.sum)*100).toFixed(0) + " %"
                        font.pixelSize: parent.height * 0.3
                        color: "gray"
                        Layout.alignment: Qt.AlignRight| Qt.AlignVCenter
                    }
                }

                RowLayout
                {
                    Layout.preferredWidth: parent.width * 0.9
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.alignment: Qt.AlignHCenter

                    Rectangle
                    {
                        Layout.preferredHeight: parent.height * 0.3
                        Layout.preferredWidth: parent.height * 0.3
                        radius: parent.height * 0.2
                        color: "blue"
                        Layout.alignment: Qt.AlignLeft| Qt.AlignVCenter
                    }

                    Text
                    {
                        text: "Углеводы"
                        font.pixelSize: parent.height * 0.3
                        color: "gray"
                        Layout.alignment: Qt.AlignLeft| Qt.AlignVCenter
                    }

                    Text
                    {
                        text: parseFloat((canvas.data[1]/canvas.sum)*100).toFixed(0) + " %"
                        font.pixelSize: parent.height * 0.3
                        color: "gray"
                        Layout.alignment: Qt.AlignRight| Qt.AlignVCenter
                    }
                }

                RowLayout
                {
                    Layout.preferredWidth: parent.width * 0.9
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.alignment: Qt.AlignHCenter

                    Rectangle
                    {
                        Layout.preferredHeight: parent.height * 0.3
                        Layout.preferredWidth: parent.height * 0.3
                        radius: parent.height * 0.2
                        color: "yellow"
                        Layout.alignment: Qt.AlignLeft| Qt.AlignVCenter
                    }

                    Text
                    {
                        text: "Жиры"
                        font.pixelSize: parent.height * 0.3
                        color: "gray"
                        Layout.alignment: Qt.AlignLeft| Qt.AlignVCenter
                    }

                    Text
                    {
                        text: parseFloat((canvas.data[2]/canvas.sum)*100).toFixed(0) + " %"
                        font.pixelSize: parent.height * 0.3
                        color: "gray"
                        Layout.alignment: Qt.AlignRight| Qt.AlignVCenter
                    }
                }

                RowLayout
                {
                    Layout.preferredWidth: parent.width * 0.9
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.alignment: Qt.AlignHCenter

                    Rectangle
                    {
                        Layout.preferredHeight: parent.height * 0.3
                        Layout.preferredWidth: parent.height * 0.3
                        radius: parent.height * 0.2
                        color: "green"
                        Layout.alignment: Qt.AlignLeft| Qt.AlignVCenter
                    }

                    Text
                    {
                        text: "Клетчатка"
                        font.pixelSize: parent.height * 0.3
                        color: "gray"
                        Layout.alignment: Qt.AlignLeft| Qt.AlignVCenter
                    }

                    Text
                    {
                        text: parseFloat((canvas.data[3]/canvas.sum)*100).toFixed(0) + " %"
                        font.pixelSize: parent.height * 0.3
                        color: "gray"
                        Layout.alignment: Qt.AlignRight| Qt.AlignVCenter
                    }
                }
            }
            }
        }
        }

    }

    Item
    {
        Layout.fillWidth: true
        Layout.fillHeight: true
    }
    }
}
