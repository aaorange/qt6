/****************************************************************************
**  小球合并时,产生的动画控件
** Author   : chen hailin
** Create   : 2022/6/29
****************************************************************************/

import QtQuick
import QtQuick.Particles
import QtMultimedia
Item {
    property var mergeSrc: ""
    property var modelSize: 5

    id: merge

    Repeater {
        model: modelSize
        Image {
            fillMode: Image.Stretch
            anchors.fill: parent
            source: mergeSrc
            rotation: Math.random()*90
            opacity: (modelSize - index) / modelSize    // 0 -> 1
            scale:  (modelSize - index) / modelSize     // 0 -> 1

            NumberAnimation on opacity {
                id: mergeAnimation
                running: true
                to: 1.0; duration: 200
                onFinished: merge.animationFinished()
            }
        }
    }




    function animationFinished() {
        this.destroy(100);
    }
    Timer {

        running: true
        interval: 300
        onTriggered: merge.destroy()
    }

    Component.onCompleted: {}
}
