import QtQuick
import org.shotcut.qml

Metadata {
    type: Metadata.Filter
    name: qsTr("Mirror")
    keywords: qsTr('horizontal flip transpose flop', 'search keywords for the Mirror video filter') + ' mirror gpu'
    mlt_service: "movit.mirror"
    needsGPU: true
    qml: "ui.qml"
    icon: 'icon.webp'
}
