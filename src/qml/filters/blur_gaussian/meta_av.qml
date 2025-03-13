/*
 * Copyright (c) 2022 Meltytech, LLC
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
import org.shotcut.qml

Metadata {
    type: Metadata.Filter
    name: qsTr("Blur: Gaussian")
    keywords: qsTr('soften obscure hide', 'search keywords for the Blur: Box video filter') + ' blur: gaussian'
    objectName: 'blur_gaussian_av'
    mlt_service: "avfilter.gblur"
    qml: "ui_av.qml"
    icon: 'icon.webp'

    keyframes {
        allowAnimateIn: true
        allowAnimateOut: true
        simpleProperties: ['av.sigma', 'av.sigmaV']
        parameters: [
            Parameter {
                name: qsTr('Amount')
                property: 'av.sigma'
                gangedProperties: ['av.sigmaV']
                isCurve: true
                minimum: 0
                maximum: 100
            }
        ]
    }
}
