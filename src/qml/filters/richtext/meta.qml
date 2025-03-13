import QtQuick
import org.shotcut.qml

Metadata {
    type: Metadata.Filter
    objectName: 'richText'
    name: qsTr('Text: Rich')
    keywords: qsTr('type font format overlay', 'search keywords for the Text: Rich video filter') + ' html text: rich'
    mlt_service: 'qtext'
    qml: "ui.qml"
    vui: 'vui.qml'
    icon: 'icon.webp'
    isFavorite: true

    keyframes {
        allowAnimateIn: true
        allowAnimateOut: true
        simpleProperties: ['geometry', 'bgcolour']
        parameters: [
            Parameter {
                name: qsTr('Position / Size')
                property: 'geometry'
                isRectangle: true
            },
            Parameter {
                name: qsTr('Background color')
                property: 'bgcolour'
                isCurve: false
                isColor: true
            }
        ]
    }
}
