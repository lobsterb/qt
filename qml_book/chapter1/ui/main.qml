import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 400
    // width: imgBackground.width   // 绑定, 不是赋值
    // height: imgBackground.height
    visible: true
    title: qsTr("风车")

    Image {
        anchors.fill: parent;   // 用当前元素填充parent
        id: imgBackground   // 标识符
        source: "qrc:/res/assets/images/background.png"

        Image {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height / 2
            id: imgPole
            source: "qrc:/res/assets/images/pole.png"
        }

        Image {
            anchors.centerIn: parent
            // anchors.horizontalCenter: parent.h000orizontalCenter
            // anchors.verticalCenter: parent.verticalCenter
            id: imgWheel
            source: "qrc:/res/assets/images/pinwheel.png"

            Behavior on rotation{
                NumberAnimation{
                    easing.type: Easing.Linear
                    duration: 5000
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: imgWheel.rotation += 360
            }
        }
    }
}
