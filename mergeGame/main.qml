/****************************************************************************
**  主界面
** Author   : chen hailin
** Create   : 2022/6/28
****************************************************************************/

import QtQuick
import QtQuick.Particles
import QtQuick.Window
import QtQuick.Controls
Window {
    id: screen
    visible: true
    width: 480; height: 840
    title: "合成大西瓜"
    Rectangle {
        id: home
        width: parent.width;
        height: parent.height - 80
        color: "#FFE89D"
        GameCanvas {
            id: gameCanvas
            anchors.fill: parent
        }
    }
    Image {
        id: background
        width: parent.width;
        height: 80
        anchors.top: home.bottom
        source: "qrc:/icon/bottomBack.png"
        fillMode: Image.PreserveAspectCrop
    }

    FinishWindow {
        anchors.fill: parent
        visible: gameCanvas.finish == 2
        score: gameCanvas.score
    }

}
