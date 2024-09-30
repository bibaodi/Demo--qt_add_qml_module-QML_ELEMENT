import QtQuick
import com.mycompany.qmlcomponents 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Text {
        width: 100
        height: 100
        anchors.centerIn: parent
        text: BindQmlPropertyToCppFunctionItem.theChange
        font.pointSize: 25
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Rectangle {
        id: id_bindee //Property Binding
        width: 200
        height: 200 + id_cpp.value /*Qt.binding(function () {return 200 + id_cpp.value}) //-getHeight() //*/
        Rectangle {
            id: id_binder
            width: 100
            height: parent.height
            color: "blue"
        }
        function getHeight() {
            return Qt.binding(function () {
                return 200 + id_cpp.value
            })
        }
        Component.onCompleted: {
            id_binder.height = Qt.binding(function () {
                return this.width * 2
            })
            console.log("id_binder.height = " + id_binder.height) // prints 200, not 1000
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
            id_bindee.height += id_cpp.value
            console.log("value=:", id_cpp.value += 2)
        }
    }
    Item {
        id: id_keyEvItem
        anchors.fill: parent
        focus: true //this is neceeeary!!!
        Keys.onPressed: event => {
                            if (event.key === Qt.Key_Left) {
                                console.log("move left")
                                event.accepted = true
                            } else if (event.key === Qt.Key_Enter) {
                                console.log("Key_Enter")
                            } else {

                                //console.log("key=", event.key)
                            }
                            id_binder.height = 300
                        }
    }
}
