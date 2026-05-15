// // #ifndef FORWARD_COLLISION_H
// // #define FORWARD_COLLISION_H

// // class forward_collision
// // {
// // public:
// //     forward_collision();
// // };

// // #endif // FORWARD_COLLISION_H

// #ifndef FORWARDCOLLISION_H
// #define FORWARDCOLLISION_H

// #include <QObject>

// class ForwardCollision : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(int collisionStatus READ collisionStatus WRITE setCollisionStatus NOTIFY collisionStatusChanged)

// public:
//     explicit ForwardCollision(QObject *parent = nullptr);

//     int collisionStatus() const;
//     void setCollisionStatus(int status);

// signals:
//     void collisionStatusChanged();

// private:
//     int m_collisionStatus; // 0 = off, 1 = on
// };

// #endif // FORWARDCOLLISION_H

#ifndef FORWARD_COLLISION_H
#define FORWARD_COLLISION_H

#include <QObject>

class ForwardCollision : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int collisionStatus READ collisionStatus WRITE setCollisionStatus NOTIFY collisionStatusChanged)

public:
    explicit ForwardCollision(QObject *parent = nullptr);

    int collisionStatus() const;
    void setCollisionStatus(int status);

    Q_INVOKABLE void saveCollisionStatus();
    Q_INVOKABLE void loadCollisionStatus();

signals:
    void collisionStatusChanged();
    void startFeature(const QString &feature);
    void stopFeature(const QString &feature);

private:
    int m_collisionStatus = 0;
};

#endif // FORWARD_COLLISION_H
