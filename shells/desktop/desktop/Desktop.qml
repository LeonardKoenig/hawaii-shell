/****************************************************************************
 * This file is part of Hawaii.
 *
 * Copyright (C) 2014-2015 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
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
import Hawaii.Themes 1.0 as Themes
import "../components"

Item {
    id: root

    Clock {
        id: clock
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
        }
        z: 0
        onClicked: topDrawer.toggle()
    }

    SlidingPanel {
        id: topDrawer
        edge: Qt.TopEdge
        height: Themes.Units.gu(15)
        z: 1

        Loader {
            id: loader
            anchors.fill: parent
            anchors.margins: Themes.Units.largeSpacing
            active: topDrawer.expanded
            source: "../controlcenter/ControlCenter.qml"

            Connections {
                target: loader.item
                onClosed: topDrawer.close()
            }
        }
    }
}
