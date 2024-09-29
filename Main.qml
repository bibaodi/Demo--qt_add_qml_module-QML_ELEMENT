import QtQuick
import com.mycompany.qmlcomponents 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    CPP_CLASS2QML {
        id: id_cpp
        value: 12
        Component.onCompleted: {
            console.log("value=:", id_cpp.value)
            slide(CPP_CLASS2QML.Icy)
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("value=:", id_cpp.value)
        }
    }
}
