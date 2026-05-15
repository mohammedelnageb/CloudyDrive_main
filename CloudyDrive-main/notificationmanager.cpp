#include "notificationmanager.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardPaths>
#include <QDir>
#include <QDebug>
#include <QCoreApplication>


NotificationManager::NotificationManager(QObject *parent)
    : QObject(parent), m_notificationType("l")
{
    QString path = notificationFilePath();

    // Ensure the file exists
    if (!QFile::exists(path)) {
        saveNotificationType();
    }

    // Watch for changes
    m_watcher.addPath(path);
    connect(&m_watcher, &QFileSystemWatcher::fileChanged, this, [this, path]() {
        qDebug() << "notification_flags.json changed, reloading...";
        loadNotificationType();

        // Re-add path in case file was overwritten (Qt bug workaround)
        m_watcher.addPath(path);
    });

    // Initial load
    loadNotificationType();
}

QString NotificationManager::notificationType() const
{
    return m_notificationType;
}

void NotificationManager::setNotificationType(const QString &type)
{
    if (m_notificationType != type) {
        m_notificationType = type;
        emit notificationTypeChanged();
    }
}

void NotificationManager::saveNotificationType()
{
    QString path = notificationFilePath();
    QDir dir(QFileInfo(path).absolutePath());

    if (!dir.exists()) {
        dir.mkpath(".");
    }

    QFile file(path);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        qWarning() << "Failed to open file for writing at" << path;
        return;
    }

    QJsonObject obj;
    obj["notificationType"] = m_notificationType;

    QJsonDocument doc(obj);
    file.write(doc.toJson());
    file.close();

    qDebug() << "Saved notification type to" << path;
}

void NotificationManager::loadNotificationType()
{
    QString path = notificationFilePath();
    QFile file(path);

    if (!file.exists()) {
        qWarning() << "File does not exist. Creating a new one.";
        saveNotificationType();
        return;
    }

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Failed to open file for reading at" << path;
        return;
    }

    QByteArray data = file.readAll();
    file.close();

    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (!doc.isObject()) {
        qWarning() << "Invalid JSON format";
        return;
    }

    QJsonObject obj = doc.object();
    if (obj.contains("notificationType") && obj["notificationType"].isString()) {
        setNotificationType(obj["notificationType"].toString());
    }
}
QString NotificationManager::notificationFilePath() const
{
    return QCoreApplication::applicationDirPath() + "/notification_flags.json";
}


