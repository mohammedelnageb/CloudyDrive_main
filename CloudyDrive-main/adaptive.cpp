// #include "adaptive.h"

// Adaptive::Adaptive(QObject *parent)
//     : QObject(parent), m_adaptiveStatus(0) {}

// int Adaptive::adaptiveStatus() const {
//     return m_adaptiveStatus;
// }

// void Adaptive::setAdaptiveStatus(int status) {
//     if (m_adaptiveStatus != status) {
//         m_adaptiveStatus = status;
//         emit adaptiveStatusChanged();
//     }
// }


#include "adaptive.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QCoreApplication>
#include <QDebug>

Adaptive::Adaptive(QObject *parent)
    : QObject(parent), m_adaptiveStatus(0)
{
    loadAdaptiveStatus(); // Auto-load at start
}

int Adaptive::adaptiveStatus() const
{
    return m_adaptiveStatus;
}

void Adaptive::setAdaptiveStatus(int status)
{
    if (m_adaptiveStatus != status) {
        m_adaptiveStatus = status;
        emit adaptiveStatusChanged();
        saveAdaptiveStatus(); // Auto-save on change
    }
}

QString Adaptive::adaptiveFilePath() const
{
    return QCoreApplication::applicationDirPath() + "/adaptive_flags.json";
}

void Adaptive::saveAdaptiveStatus()
{
    QFile file(adaptiveFilePath());

    if (!file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        qWarning() << "Failed to open file for writing at" << file.fileName();
        return;
    }

    QJsonObject obj;
    obj["adaptiveStatus"] = m_adaptiveStatus;

    QJsonDocument doc(obj);
    file.write(doc.toJson());
    file.close();

    qDebug() << "Saved adaptiveStatus to:" << file.fileName();
}

void Adaptive::loadAdaptiveStatus()
{
    QFile file(adaptiveFilePath());

    if (!file.exists()) {
        qWarning() << "File does not exist. Creating a default file.";
        saveAdaptiveStatus();  // Create default file
        return;
    }

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Failed to open file for reading at" << file.fileName();
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
    if (obj.contains("adaptiveStatus")) {
        setAdaptiveStatus(obj["adaptiveStatus"].toInt());
        qDebug() << "Loaded adaptiveStatus:" << m_adaptiveStatus;
    }
}


