import QtQuick
import com.mycompany.qmlcomponents 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle {
        id: id_bindee //Property Binding
        width: 200
        height: getHeight() //200 + id_cpp.value

        Rectangle {
            width: 100
            height: parent.height
            color: "blue"
        }
        function getHeight() {
            return 200 + id_cpp.value
        }
    }
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
            //id_bindee.height += id_cpp.value
            console.log("value=:", id_cpp.value += 2)
        }
    }
    Item {
        id: id_keyEvItem
        anchors.fill: parent
        focus: true
        Keys.onPressed: event => {
                            if (event.key === Qt.Key_Left) {
                                console.log("move left")
                                event.accepted = true
                            } else if (event.key === Qt.Key_Enter) {
                                console.log("Key_Enter")
                            } else {
                                console.log("key=", event.key)
                            }
                        }
    }
}
