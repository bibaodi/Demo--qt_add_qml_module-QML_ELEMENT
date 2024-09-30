import QtQuick

Rectangle {
    property var prop_ParentCppObj: null
    color: "yellow"
    Text {
        id: id_textShowParentCppObjValue
        text: "2cdLevel:" + prop_ParentCppObj.theChange //qsTr("text")
        font.pointSize: 11
    }
}
