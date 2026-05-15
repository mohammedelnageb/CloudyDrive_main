#include "lane.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QCoreApplication>
#include <QDebug>

Lane::Lane(QObject *parent)
    : QObject(parent), m_laneStatus(0)
{
    loadLaneStatus(); // Auto-load on startup
}

int Lane::laneStatus() const
{
    return m_laneStatus;
}

void Lane::setLaneStatus(int status)
{
    if (m_laneStatus != status) {
        m_laneStatus = status;
        emit laneStatusChanged();
        saveLaneStatus(); // Auto-save on change
    }
}

QString Lane::laneFilePath() const
{
    return QCoreApplication::applicationDirPath() + "/lane_flags.json";
}

void Lane::saveLaneStatus()
{
    QFile file(laneFilePath());

    if (!file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
        qWarning() << "Failed to open file for writing at" << file.fileName();
        return;
    }

    QJsonObject obj;
    obj["laneStatus"] = m_laneStatus;

    QJsonDocument doc(obj);
    file.write(doc.toJson());
    file.close();

    qDebug() << "Saved laneStatus to:" << file.fileName();
}

void Lane::loadLaneStatus()
{
    QFile file(laneFilePath());

    if (!file.exists()) {
        qWarning() << "File does not exist. Creating a default one.";
        saveLaneStatus();  // Create default file
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
    if (obj.contains("laneStatus")) {
        setLaneStatus(obj["laneStatus"].toInt());
        qDebug() << "Loaded laneStatus:" << m_laneStatus;
    }
}
