import QtQuick
import org.shotcut.qml

Metadata {
    type: Metadata.Filter
    name: qsTr("Posterize")
    keywords: qsTr('reduce colors banding cartoon', 'search keywords for the Posterize video filter') + ' posterize'
    objectName: 'posterize'
    mlt_service: "frei0r.posterize"
    qml: "ui.qml"
    icon: 'icon.webp'

    keyframes {
        allowAnimateIn: true
        allowAnimateOut: true
        simpleProperties: ['0']
        parameters: [
            Parameter {
                name: qsTr('Levels', 'Posterize filter')
                property: '0'
                isCurve: true
                minimum: 0
                maximum: 1
            }
        ]
    }
}
