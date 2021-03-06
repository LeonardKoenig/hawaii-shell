/****************************************************************************
 * This file is part of Hawaii.
 *
 * Copyright (C) 2015 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * Author(s):
 *    Pier Luigi Fiorini
 *
 * $BEGIN_LICENSE:GPL2+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.3
import Hawaii.Components 1.0 as Components
import Hawaii.Themes 1.0 as Themes
import org.hawaii.mixer 0.1 as MixerService

RowLayout {
    Components.Icon {
        width: Themes.Units.iconSizes.small
        height: width
        iconName: "audio-volume-low-symbolic"
        cache: false

        MouseArea {
            anchors.fill: parent
            onClicked: MixerService.Mixer.decreaseMaster()
        }
    }

    Slider {
        id: slider
        minimumValue: 0
        maximumValue: 100
        value: 0
        onValueChanged: {
            // Set mixer value only if pressed to avoid loops
            if (slider.pressed)
                MixerService.Mixer.master = slider.value;
        }

        Connections {
            target: MixerService.Mixer
            onMasterChanged: {
                // Set mixer value only if not pressed to avoid loops
                if (!slider.pressed)
                    slider.value = MixerService.Mixer.master;
            }
        }

        Layout.fillWidth: true

        Component.onCompleted: value = MixerService.Mixer.master
    }

    Components.Icon {
        width: Themes.Units.iconSizes.small
        height: width
        iconName: "audio-volume-high-symbolic"
        cache: false

        MouseArea {
            anchors.fill: parent
            onClicked: MixerService.Mixer.increaseMaster()
        }
    }
}
