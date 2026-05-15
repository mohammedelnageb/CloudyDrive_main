// #ifndef ADAPTIVE_H
// #define ADAPTIVE_H

// #include <QObject>

// class Adaptive : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(int adaptiveStatus READ adaptiveStatus WRITE setAdaptiveStatus NOTIFY adaptiveStatusChanged)

// public:
//     explicit Adaptive(QObject *parent = nullptr);

//     int adaptiveStatus() const;
//     void setAdaptiveStatus(int status);

// signals:
//     void adaptiveStatusChanged();

// private:
//     int m_adaptiveStatus; // 0 = off, 1 = on
// };

// #endif // ADAPTIVE_H


// #ifndef ADAPTIVE_H
// #define ADAPTIVE_H

// #include <QObject>

// class Adaptive : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(int adaptiveStatus READ adaptiveStatus WRITE setAdaptiveStatus NOTIFY adaptiveStatusChanged)

// public:
//     explicit Adaptive(QObject *parent = nullptr);

//     int adaptiveStatus() const;
//     void setAdaptiveStatus(int status);

//     void saveAdaptiveStatus();   // Save status to file
//     void loadAdaptiveStatus();   // Load status from file

// signals:
//     void adaptiveStatusChanged();

// private:
//     int m_adaptiveStatus; // 0 = off, 1 = on
// };

// #endif // ADAPTIVE_H


#ifndef ADAPTIVE_H
#define ADAPTIVE_H

#include <QObject>

class Adaptive : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int adaptiveStatus READ adaptiveStatus WRITE setAdaptiveStatus NOTIFY adaptiveStatusChanged)

public:
    explicit Adaptive(QObject *parent = nullptr);

    int adaptiveStatus() const;
    void setAdaptiveStatus(int status);

    void loadAdaptiveStatus();
    void saveAdaptiveStatus();

signals:
    void adaptiveStatusChanged();

private:
    int m_adaptiveStatus;
    QString adaptiveFilePath() const;
};

#endif // ADAPTIVE_H
