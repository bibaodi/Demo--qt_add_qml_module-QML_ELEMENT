import QtQuick
import com.mycompany.qmlcomponents 1.0

/*QmlAutoUpdateOnQtProp*/
Item {
    BindQmlPropertyToCppFunction {
        id: id_BindQmlPropertyToCppFunctionItem
    }
    Text {
        width: 200
        height: 100
        text: id_BindQmlPropertyToCppFunctionItem.theChange
        font.pointSize: 13
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
