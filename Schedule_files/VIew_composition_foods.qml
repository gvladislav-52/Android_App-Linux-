import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
        anchors.fill: parent
        color: "#1e1e1e"

        Canvas
        {
            id: canvas
            width: parent.width * 0.25
            height: parent.height * 0.25
            anchors.horizontalCenter: parent.horizontalCenter
            property variant data: [30,40,20]

            onPaint:
            {
                var ctx = getContext("2d")
                if (ctx === null)
                    console.log("Error canvas paint")
                var total = data.reduce(function(acc,val)
                {
                   return acc+val
                },0)

                var startPoint = 0
                var colors = ["red","green","blue"]

                for(var i = 0; i <data.length; i++)
                {
                    var angle = 2 * Math.PI * (data[i]/total)
                    ctx.beginPath()
                    ctx.moveTo(canvas.width/2,canvas.height/2)
                    ctx.arc(canvas.width/2,canvas.height/2,canvas.width/2,startPoint, startPoint + angle)
                    ctx.closePath()
                    ctx.fillStyle = colors[i]
                    ctx.fill()
                    startPoint += angle
                }
            }
        }
    }
