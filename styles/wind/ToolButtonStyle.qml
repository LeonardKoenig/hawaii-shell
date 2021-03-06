/****************************************************************************
 * This file is part of Hawaii.
 *
 * Copyright (C) 2014-2015 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * Author(s):
 *    Pier Luigi Fiorini
 *
 * $BEGIN_LICENSE:LGPL2.1+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.0
import QtQuick.Controls.Private 1.0 as QtControlsPrivate
import Hawaii.Components 1.0 as Components
import Hawaii.Themes 1.0

QtControlsPrivate.ToolButtonStyle {
    id: style
    panel: Item {
        id: styleitem
        implicitWidth: (hasIcon ? icon.width : Math.max(label.implicitWidth + frame.border.left + frame.border.right, Units.dp(36)))
                                 + (arrow.visible ? Units.dp(10) : 0)
        implicitHeight: hasIcon ? icon.height : Math.max(label.implicitHeight, Units.dp(36))

        readonly property bool hasIcon: icon.status === Image.Ready || icon.status === Image.Loading

        Rectangle {
            property color c: Theme.palette.panel.backgroundColor

            id: baserect
            anchors.fill: parent
            border.color: Qt.darker(baserect.c, 1.2)
            radius: 4
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: style.pressed ? Qt.darker(baserect.c, 1.4) : Qt.lighter(baserect.c, 1.8)
                }
                GradientStop {
                    position: 0.1
                    color: style.pressed ? Qt.darker(baserect.c, 1.15) : Qt.lighter(baserect.c, 1.4)
                }
                GradientStop {
                    position: 0.8
                    color: style.pressed ? Qt.darker(baserect.c, 0.76) : baserect.c
                }
                GradientStop {
                    position: 1.0
                    color: pressed ? Qt.darker(baserect.c, 0.65) : Qt.darker(baserect.c, 1.3)
                }
            }
            antialiasing: true
            visible: control.pressed || (control.checkable && control.checked)
        }

        Item {
            anchors.left: parent.left
            anchors.right: arrow.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: true

            Text {
                id: label
                visible: !hasIcon
                anchors.centerIn: parent
                text: control.text
                renderType: QtControlsPrivate.Settings.isMobile ? Text.QtRendering : Text.NativeRendering
                color: Theme.palette.panel.textColor
            }

            Components.Icon {
                id: icon
                anchors.centerIn: parent
                iconName: control.__action.iconName ? control.__action.iconName : control.iconName ? control.iconName : ""
                iconSource: {
                    if (control.__action && !control.__action.iconName)
                        return control.__action.iconSource;
                    if (control.iconSource)
                        return control.iconSource;
                    return "";
                }
                color: Theme.palette.panel.textColor
                width: control.iconSize > 0 ? control.iconSize : units.iconSizes.smallMedium
                height: width
            }
        }

        BorderImage {
            id: frame
            anchors.fill: parent
            anchors.margins: -1
            anchors.topMargin: -2
            anchors.rightMargin: 0
            border.left: 4
            border.right: 4
            border.top: 4
            border.bottom: 4
            source: "images/focusframe.png"
            visible: control.activeFocus
        }

        Image {
            id: arrow
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: visible ? 3 : 0
            source: visible ? "images/arrow-down.png" : ""
            opacity: control.enabled ? 0.7 : 0.5
            visible: control.menu !== null
        }
    }
}
