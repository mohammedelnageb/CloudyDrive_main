QT += core gui quick quickcontrols2 multimedia multimediawidgets virtualkeyboard svg location positioning

CONFIG += qml_debug

SOURCES += \
    adaptive.cpp \
    forward_collision.cpp \
    lane.cpp \
    main.cpp \
    notificationmanager.cpp

HEADERS += \
    adaptive.h \
    forward_collision.h \
    lane.h \
    notificationmanager.h

RESOURCES += qml.qrc

# Deployment rules (optional, you can customize as needed)
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
