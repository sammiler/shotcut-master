import QtQuick
import org.shotcut.qml

Metadata {
    type: Metadata.Filter
    isAudio: false
    name: qsTr("Track Auto Fade Video")
    keywords: qsTr('splice fade dip', 'search keywords for the Track Auto Fade Video filter') + ' auto fade'
    mlt_service: "autofade"
    objectName: 'autoFadeVideo'
    qml: "ui.qml"
    isTrackOnly: true
    minimumVersion: '2'
}
