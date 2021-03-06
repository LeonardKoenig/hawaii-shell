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
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import Hawaii.Themes 1.0 as Themes
import org.hawaii.appchooser 0.1 as AppChooser
import "../components"

FocusScope {
    signal closed()

    id: root
    //height: Themes.Units.gu(17)

    AppChooser.ProcessRunner {
        id: processRunner

        function executeSetting(name) {
            root.closed();
            runSetting(name);
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: Themes.Units.largeSpacing

        RowLayout {
            spacing: Themes.Units.largeSpacing

            RowLayout {
                spacing: Themes.Units.largeSpacing

                Label {
                    text: "Weather: 20 C, Clear"
                    font.pointSize: Themes.Theme.defaultFont.pointSize * 0.9
                    color: Themes.Theme.palette.panel.textColor

                    MouseArea {
                        anchors.fill: parent
                        onClicked: stackView.push(weatherComponent)
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    text: "Clock Settings"
                    //onClicked: stackView.push(clockSettingsComponent)
                    onClicked: processRunner.executeSetting("clock")
                }

                Layout.alignment: Qt.AlignTop
            }

            Clock {
                onClicked: stackView.push(calendarComponent)
                onDoubleClicked: root.closed()

                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.fillHeight: true
            }

            RowLayout {
                spacing: Themes.Units.largeSpacing

                Button {
                    text: "Add Appointment"
                    onClicked: stackView.push(appointmentComponent)
                }

                Item {
                    Layout.fillWidth: true
                }

                Label {
                    text: "System Language: English"
                    font.pointSize: Themes.Theme.defaultFont.pointSize * 0.9
                    color: Themes.Theme.palette.panel.textColor

                    MouseArea {
                        anchors.fill: parent
                        //onClicked: stackView.push(languageComponent)
                        onClicked: processRunner.executeSetting("translations")
                    }
                }

                Layout.alignment: Qt.AlignTop
            }
        }

        StackView {
            id: stackView
            initialItem: calendarComponent

            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    Component {
        id: calendarComponent

        CalendarView {
            selectedDate: new Date()
        }
    }

    Component {
        id: weatherComponent

        Item {
            Label {
                anchors.centerIn: parent
                text: "Not implemented yet"
                color: Themes.Theme.palette.panel.textColor
            }
        }
    }

    Component {
        id: clockSettingsComponent

        Item {
            Label {
                anchors.centerIn: parent
                text: "Not implemented yet"
                color: Themes.Theme.palette.panel.textColor
            }
        }
    }

    Component {
        id: appointmentComponent

        Item {
            Label {
                anchors.centerIn: parent
                text: "Not implemented yet"
                color: Themes.Theme.palette.panel.textColor
            }
        }
    }

    Component {
        id: languageComponent

        Item {
            Label {
                anchors.centerIn: parent
                text: "Not implemented yet"
                color: Themes.Theme.palette.panel.textColor
            }
        }
    }
}
