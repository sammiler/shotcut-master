/*
 * Copyright (c) 2013-2024 Meltytech, LLC
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick
import QtQuick.Controls
import Shotcut.Controls as Shotcut

Rectangle {
    id: rulerTop

    property real timeScale: 1
    readonly property real intervalFrames: profile.fps * ((timeScale > 5) ? 1 : (5 * Math.max(1, Math.floor(1.5 / timeScale))))

    signal editMarkerRequested(int index)
    signal deleteMarkerRequested(int index)

    height: 28
    color: activePalette.base

    Timer {
        id: updateTimer
        interval: 100
        onTriggered: repeater.model = Math.round(width / intervalFrames / timeScale)
    }

    SystemPalette {
        id: activePalette
    }

    Repeater {
        id: repeater

        Rectangle {

            // right edge
            anchors.bottom: rulerTop.bottom
            height: 18
            width: 1
            color: activePalette.windowText
            x: index * intervalFrames * timeScale
            visible: ((x + width) > tracksFlickable.contentX) && (x < tracksFlickable.contentX + tracksFlickable.width) // left edge

            Label {
                anchors.left: parent.right
                anchors.leftMargin: 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2
                color: activePalette.windowText
                text: application.clockFromFrames(index * intervalFrames + 2).substr(0, 8)
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        onExited: bubbleHelp.hide()
        property double currentPos: timeline.position * timeScale
        cursorShape: (mouseX >= currentPos - 8 && mouseX <= currentPos + 8) ? Qt.SizeHorCursor : Qt.ArrowCursor
        onPositionChanged: mouse => {
            var text = application.timeFromFrames(mouse.x / timeScale);
            bubbleHelp.show(text);
        }
    }

    Shotcut.MarkerBar {
        anchors.top: rulerTop.top
        anchors.left: parent.left
        anchors.right: parent.right
        timeScale: rulerTop.timeScale
        model: markers
        onExited: bubbleHelp.hide()
        onMouseStatusChanged: (mouseX, mouseY, text, start, end) => {
            var msg = "<center>" + text;
            if (start === end) {
                msg += "<br>" + application.timeFromFrames(start);
            } else {
                msg += "<br>" + application.timeFromFrames(start) + " - " + application.timeFromFrames(end);
                msg += "<br>" + application.timeFromFrames(end - start + 1);
            }
            msg += "</center>";
            bubbleHelp.show(msg);
        }
        onSeekRequested: pos => timeline.position = pos

        snapper: QtObject {
            function getSnapPosition(position) {
                if (!settings.timelineSnap)
                    return position;
                var SNAP = 10;
                // Snap to clips on tracks.
                var timeline = root;
                for (var j = 0; j < timeline.trackCount; j++) {
                    var track = timeline.trackAt(j);
                    for (var i = 0; i < track.clipCount; i++) {
                        var item = track.clipAt(i);
                        if (item.isBlank)
                            continue;
                        var itemLeft = item.x;
                        var itemRight = itemLeft + item.width;
                        if (position > itemLeft - SNAP && position < itemLeft + SNAP)
                            return itemLeft;
                        else if (position > itemRight - SNAP && position < itemRight + SNAP)
                            return itemRight;
                        else if (itemRight + SNAP > position)
                            continue;
                    }
                }
                // Snap around cursor/playhead.
                var cursorX = tracksFlickable.contentX + cursor.x;
                if (position > cursorX - SNAP && position < cursorX + SNAP)
                    return cursorX;
                return position;
            }
        }
    }

    Connections {
        function onProfileChanged() {
            updateTimer.restart();
        }

        target: profile
    }

    Connections {
        function onDurationChanged() {
            updateTimer.restart();
        }

        function onScaleFactorChanged() {
            updateTimer.restart();
        }

        target: multitrack
    }
}
