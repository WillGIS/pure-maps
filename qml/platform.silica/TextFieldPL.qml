/* -*- coding: utf-8-unix -*-
 *
 * Copyright (C) 2018 Rinigus
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

import QtQuick 2.0
import Sailfish.Silica 1.0

Item {

    id: row

    height: childrenRect.height
    width: parent.width

    property alias description: desc.text
    property alias inputMethodHints: entry.inputMethodHints
    property alias label: entry.label
    property alias placeholderText: entry.placeholderText
    property alias text: entry.text

    signal enter

    TextField {
        id: entry
        anchors.left: parent.left
        anchors.right: clearButton.left
        labelVisible: !description
        EnterKey.iconSource: "image://theme/icon-m-enter-next"
        EnterKey.onClicked: row.enter();
    }

    IconButtonPL {
        id: clearButton
        anchors.right: parent.right
        anchors.rightMargin: visible ? app.styler.themePaddingMedium : 0
        anchors.verticalCenter: entry.verticalCenter
        iconName: app.styler.iconEditClear
        iconHeight: app.styler.themeFontSizeMedium
        visible: entry.text && entry.activeFocus
        onClicked: entry.text = ""
    }

    Label {
        id: desc
        anchors.left: entry.left
        anchors.leftMargin: app.styler.themeHorizontalPageMargin
        anchors.right: parent.right
        anchors.rightMargin: app.styler.themeHorizontalPageMargin
        anchors.top: entry.bottom
        anchors.topMargin: text ? app.styler.themePaddingSmall : 0
        font.pixelSize: app.styler.themeFontSizeSmall
        height: text ? implicitHeight : 0
        visible: text
        wrapMode: Text.WordWrap
    }
}
