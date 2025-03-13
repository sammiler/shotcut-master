import QtQuick
import org.shotcut.qml

Metadata {
    type: Metadata.Filter
    name: qsTr("Dither")
    keywords: qsTr('noise dots', 'search keywords for the Dither video filter') + ' dither'
    objectName: 'dither'
    mlt_service: "frei0r.dither"
    qml: "ui.qml"
    icon: 'icon.webp'

    keyframes {
        allowAnimateIn: true
        allowAnimateOut: true
        simpleProperties: ['0', '1']
        parameters: [
            Parameter {
                name: qsTr('Level')
                property: '0'
                isCurve: true
                minimum: 0
                maximum: 1
            }
        ]
    }
}
