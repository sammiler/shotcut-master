import QtQuick
import org.shotcut.qml

Metadata {
    type: Metadata.Filter
    name: qsTr('Scan Lines')
    keywords: qsTr('analog horizontal television', 'search keywords for the Scan Lines video filter') + ' crt scan lines'
    mlt_service: 'frei0r.scanline0r'
    objectName: 'scanlines'
    icon: 'icon.webp'
}
