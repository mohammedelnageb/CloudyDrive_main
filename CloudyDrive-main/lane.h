#ifndef LANE_H
#define LANE_H

#include <QObject>

class Lane : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int laneStatus READ laneStatus WRITE setLaneStatus NOTIFY laneStatusChanged)

public:
    explicit Lane(QObject *parent = nullptr);

    int laneStatus() const;
    void setLaneStatus(int status);

    void loadLaneStatus();
    void saveLaneStatus();

signals:
    void laneStatusChanged();

private:
    int m_laneStatus;
    QString laneFilePath() const;
};

#endif // LANE_H
