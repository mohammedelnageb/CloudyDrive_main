# CloudyDrive

CloudyDrive is a Qt Quick vehicle dashboard concept. It combines a splash screen, side navigation, live map/search, camera view, vehicle status tiles, media controls, tire pressure views, and small C++ backends for persisted feature state.

## Screenshots

![Home layout](layout-screenshots/layout-1.png)
![Car layout](layout-screenshots/layout-2.png)
![Navigation layout](layout-screenshots/layout-3.png)
![Climate layout](layout-screenshots/layout-4.png)
![Music layout](layout-screenshots/layout-5.png)

## Features

- Qt Quick dashboard shell with Home, Car, and Navigation screens.
- OpenStreetMap-based navigation search through `QtLocation`.
- Camera preview through `QtMultimedia`.
- Persistent JSON state for forward collision, lane discipline, adaptive cruise, and notification type.
- Resource-bundled QML, icons, vehicle imagery, and music artwork through `qml.qrc`.

## Requirements

- Qt 5.15 or newer.
- A C++ compiler supported by your Qt kit.
- Qt modules: `core`, `gui`, `quick`, `quickcontrols2`, `multimedia`, `multimediawidgets`, `virtualkeyboard`, `svg`, `location`, and `positioning`.

## Build And Run

Open `CloudyDrive.pro` in Qt Creator, select a desktop Qt kit, then build and run.

From a Qt-enabled terminal:

```powershell
qmake CloudyDrive.pro
mingw32-make
.\debug\CloudyDrive.exe
```

Use the matching make command for your kit if you are not using MinGW.

## Project Layout

- `main.cpp` starts the Qt application, registers the QML singleton, and exposes C++ backend objects to QML.
- `main.qml`, `SplashScreens.qml`, and `MainPage.qml` define the application shell.
- `screens/` contains the top-level dashboard screens.
- `Components/` contains dashboard tiles and settings pages.
- `controls/` contains reusable QML controls.
- `assets/` contains the images, icons, and fonts bundled in `qml.qrc`.
- `*_collision`, `lane`, `adaptive`, and `notificationmanager` files provide small persisted-state backends.

## Notes

Generated Qt Creator user files and build outputs are intentionally not part of the cleaned project. Reopen `CloudyDrive.pro` or rerun `qmake` to regenerate them for your local machine.
