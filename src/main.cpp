// src/main.cpp

#include <KLocalizedContext>
#include <KLocalizedString>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QUrl>
#include <QtQml>

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);

    // set app metadata
    KLocalizedString::setApplicationDomain("kpdfunlock");
    QCoreApplication::setOrganizationName(QStringLiteral("KDE"));
    QCoreApplication::setOrganizationDomain(QStringLiteral("kde.org"));
    QCoreApplication::setApplicationName(QStringLiteral("KPDFUnlock"));

    // use breeze kde theme for consistency
    QQuickStyle::setStyle(QStringLiteral("org.kde.desktop"));

    // create qml engine
    QQmlApplicationEngine engine;

    // setup i18n
    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));

    // load main qml file
    engine.load(QUrl(QStringLiteral("qrc:/qml/Main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
