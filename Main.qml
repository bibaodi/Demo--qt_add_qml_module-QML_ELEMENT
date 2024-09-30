import QtQuick
import com.mycompany.qmlcomponents 1.0

Window {
    id: id_rootWd
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Column {
        QmlBindToCpp {
            id: id_qmlBindToCppInt
            width: 300
            height: 300
        }

        QmlAutoUpdateOnQtProp {
            id: id_autoUpdateText
            width: 300
            height: 50
            x: id_rootWd.width - width
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
