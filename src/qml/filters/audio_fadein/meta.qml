import QtQuick
import org.shotcut.qml

Metadata {
    type: Metadata.Filter
    isAudio: true
    objectName: 'fadeInVolume'
    name: qsTr("Fade In Audio")
    keywords: qsTr('loudness', 'search keywords for the Fade In audio filter') + ' fade in audio'
    mlt_service: "volume"
    qml: "ui.qml"
    isFavorite: true
    allowMultiple: false

    keyframes {
        allowTrim: false
        allowAnimateIn: true
    }
}
