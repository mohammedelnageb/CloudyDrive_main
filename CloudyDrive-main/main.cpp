#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>

// Include your backend classes
#include "forward_collision.h"
#include "lane.h"
#include "adaptive.h"
#include "notificationmanager.h"

int main(int argc, char *argv[])
{
    // Enable virtual keyboard
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    // Application metadata
    QCoreApplication::setOrganizationDomain("techcoderhub.com");
    QCoreApplication::setOrganizationName("TechCoderHub");
    QCoreApplication::setApplicationName("CloudyDrive");

    // Create application
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon("qrc:/assets/techcoderhub_logo.jpg"));

    // Register QML singleton (Style)
    const QUrl styleUrl(QStringLiteral("qrc:/Style.qml"));
    qmlRegisterSingletonType(styleUrl, "Style", 1, 0, "Style");

    // Backend engine
    QQmlApplicationEngine engine;

    // Backend instances
    ForwardCollision forwardCollision;
    forwardCollision.loadCollisionStatus();

    Lane lane;
    lane.loadLaneStatus();

    Adaptive adaptive;
    adaptive.loadAdaptiveStatus();

    NotificationManager notificationManager;
    notificationManager.loadNotificationType();

    // Expose C++ objects to QML
    engine.rootContext()->setContextProperty("forwardCollision", &forwardCollision);
    engine.rootContext()->setContextProperty("lane", &lane);
    engine.rootContext()->setContextProperty("adaptive", &adaptive);
    engine.rootContext()->setContextProperty("notificationManager", &notificationManager);

    // Load main QML
    const QUrl mainQmlUrl(QStringLiteral("qrc:/main.qml"));

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [mainQmlUrl](QObject *obj, const QUrl &objUrl) {
            if (!obj && mainQmlUrl == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    engine.load(mainQmlUrl);

    return app.exec();
}
