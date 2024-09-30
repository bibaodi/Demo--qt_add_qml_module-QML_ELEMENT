import QtQuick
import com.mycompany.qmlcomponents 1.0

/*QmlAutoUpdateOnQtProp*/
Item {
    BindQmlPropertyToCppFunction {
        id: id_BindQmlPropertyToCppFunctionItem
    }
    Column {
        Text {
            width: 200
            height: 100
            text: id_BindQmlPropertyToCppFunctionItem.theChange
            font.pointSize: 13
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Qml2cdLevelUseParentCppObj {
            id: id_2
            width: 200
            height: 100
            prop_ParentCppObj: id_BindQmlPropertyToCppFunctionItem
        }
    }
}
