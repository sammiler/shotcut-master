import QtQuick
import org.shotcut.qml

Metadata {
    type: Metadata.Filter
    isAudio: true
    name: qsTr("Delay")
    keywords: qsTr('time echo', 'search keywords for the Delay audio filter') + ' delay'
    mlt_service: 'ladspa.1192'
    qml: 'ui.qml'
}
