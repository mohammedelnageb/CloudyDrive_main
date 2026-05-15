//  #include "forward_collision.h"

// // forward_collision::forward_collision() {}



// ForwardCollision::ForwardCollision(QObject *parent)
//     : QObject(parent), m_collisionStatus(0) {}

// int ForwardCollision::collisionStatus() const {
//     return m_collisionStatus;
// }

// void ForwardCollision::setCollisionStatus(int status) {
//     if (m_collisionStatus != status) {
//         m_collisionStatus = status;
//         emit collisionStatusChanged();
//     }
// }

//  #include "forward_collision.h"

// // forward_collision::forward_collision() {}



// ForwardCollision::ForwardCollision(QObject *parent)
//     : QObject(parent), m_collisionStatus(0) {}

// int ForwardCollision::collisionStatus() const {
//     return m_collisionStatus;
// }

// void ForwardCollision::setCollisionStatus(int status) {
//     if (m_collisionStatus != status) {
//         m_collisionStatus = status;
//         emit collisionStatusChanged();
//     }
// }

//  #include "forward_collision.h"

// // forward_collision::forward_collision() {}



// ForwardCollision::ForwardCollision(QObject *parent)
//     : QObject(parent), m_collisionStatus(0) {}

// int ForwardCollision::collisionStatus() const {
//     return m_collisionStatus;
// }

// void ForwardCollision::setCollisionStatus(int status) {
//     if (m_collisionStatus != status) {
//         m_collisionStatus = status;
//         emit collisionStatusChanged();
//     }
// }

//  #include "forward_collision.h"

// // forward_collision::forward_collision() {}



// ForwardCollision::ForwardCollision(QObject *parent)
//     : QObject(parent), m_collisionStatus(0) {}

// int ForwardCollision::collisionStatus() const {
//     return m_collisionStatus;
// }

// void ForwardCollision::setCollisionStatus(int status) {
//     if (m_collisionStatus != status) {
//         m_collisionStatus = status;
//         emit collisionStatusChanged();
//     }
// }

#include "forward_collision.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>
#include <QStandardPaths>
#include <QDir>

ForwardCollision::ForwardCollision(QObject *parent)
    : QObject(parent)
{
}

int ForwardCollision::collisionStatus() const
{
    return m_collisionStatus;
}

void ForwardCollision::setCollisionStatus(int status)
{
    if (m_collisionStatus != status) {
        m_collisionStatus = status;
        emit collisionStatusChanged();
    }
}

#include <QCoreApplication> // Make sure this is included

void ForwardCollision::saveCollisionStatus()
{
    QString path = QCoreApplication::applicationDirPath() + "/forward_flags.json";
    QFile file(path);

    if (!file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        qWarning() << "Failed to open file for writing:" << file.fileName();
        return;
    }

    QJsonObject obj;
    obj["collisionStatus"] = m_collisionStatus;

    QJsonDocument doc(obj);
    file.write(doc.toJson());
    file.close();

    qDebug() << "Saved collisionStatus to:" << file.fileName();
}

void ForwardCollision::loadCollisionStatus()
{
    QString path = QCoreApplication::applicationDirPath() + "/forward_flags.json";
    QFile file(path);

    if (!file.exists()) {
        qWarning() << "JSON file doesn't exist, creating default one.";
        saveCollisionStatus();  // Create file with default
        return;
    }

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Failed to open file for reading:" << file.fileName();
        return;
    }

    QByteArray data = file.readAll();
    file.close();

    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (!doc.isObject()) {
        qWarning() << "Invalid JSON format.";
        return;
    }

    QJsonObject obj = doc.object();
    if (obj.contains("collisionStatus")) {
        setCollisionStatus(obj["collisionStatus"].toInt());
        qDebug() << "Loaded collisionStatus:" << m_collisionStatus;
    }
}
