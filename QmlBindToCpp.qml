import QtQuick
import com.mycompany.qmlcomponents 1.0

/*QmlBindToCpp*/
Item {
    CPP_CLASS2QML {
        id: id_cpp
        cppValue: 12
        Component.onCompleted: {
            console.log("id_cpp value=:", id_cpp.cppValue)
            slide(CPP_CLASS2QML.Icy)
        }
    }
    Rectangle {
        id: id_bindee //Property Binding
        width: 200
        height: 200 //getHeight() /*Qt.binding(function () {return 200 + id_cpp.cppValue}) //-getHeight() //*/
        Rectangle {
            id: id_binder
            width: id_bindee.getHeight()
            height: parent.height
            color: "blue"
        }
        function getHeight() {
            return (100 + id_cpp.cppValue)
        }
        Component.onCompleted: {
            id_binder.height = Qt.binding(function () {
                return this.width * 2
            })
            console.log("id_binder.height = " + id_binder.height) // prints 200, not 1000
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("value=:", id_cpp.cppValue += 2)
        }
    }
}
