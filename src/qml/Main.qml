// src/qml/Main.qml

import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.ApplicationWindow {
    id: root

    title: i18n("KPDFUnlock")
    width: Kirigami.Units.gridUnit * 40
    height: Kirigami.Units.gridUnit * 30

    pageStack.initialPage: Kirigami.Page {
        title: i18n("Hello, World!")

        ColumnLayout {
            anchors.centerIn: parent
            spacing: Kirigami.Units.largeSpacing

            Kirigami.Heading {
                text: i18n("Hello from Kirigami!!")
                level: 1
                Layout.alignment: Qt.AlignHCenter
            }

            Controls.Label {
                text: i18n("This is a modern KDE Application using:")
                Layout.alignment: Qt.AlignHCenter
            }

            ColumnLayout {
                spacing: Kirigami.Units.smallSpacing
                Layout.alignment: Qt.AlignHCenter

                Controls.Label {
                    text: "- Qt6 Quick/QML"
                    Layout.alignment: Qt.AlignLeft
                }

                Controls.Label {
                    text: "- KDE Frameworks 6"
                    Layout.alignment: Qt.AlignLeft
                }

                Controls.Label {
                    text: "- Kirigami UI Framework"
                    Layout.alignment: Qt.AlignLeft
                }

                Controls.Label {
                    text: "- C++ Backend"
                    Layout.alignment: Qt.AlignLeft
                }

            }

            Controls.Button {
                text: i18n("Click Me")
                icon.name: "dialog-ok"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    showPassiveNotification(i18n("button clicked!!!"));
                }
            }

        }

    }

}
