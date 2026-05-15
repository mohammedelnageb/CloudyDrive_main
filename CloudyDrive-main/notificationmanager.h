#ifndef NOTIFICATIONMANAGER_H
#define NOTIFICATIONMANAGER_H

#include <QObject>
#include <QFileSystemWatcher>

class NotificationManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString notificationType READ notificationType WRITE setNotificationType NOTIFY notificationTypeChanged)

public:
    explicit NotificationManager(QObject *parent = nullptr);

    QString notificationType() const;
    void setNotificationType(const QString &type);

    Q_INVOKABLE void loadNotificationType();
    Q_INVOKABLE void saveNotificationType();

signals:
    void notificationTypeChanged();

private:
    QString m_notificationType;
    QFileSystemWatcher m_watcher;
    QString notificationFilePath() const;
};

#endif // NOTIFICATIONMANAGER_H
