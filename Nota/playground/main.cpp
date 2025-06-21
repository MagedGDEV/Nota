#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QFont>


int main(int argc, char *argv[])
{



    // Specifies the way of rendering
    // To allow use of GammaRay
    #ifdef __APPLE__
        qputenv("QT_QUICK_BACKEND", "software");
    #endif
    QQuickStyle::setStyle("Fusion");
    QGuiApplication app(argc, argv);

    app.setOrganizationName("Nota App");
    app.setOrganizationDomain("maged.work0@gmail.com");

    QFont defaultFont ("Ubuntu", 12);
    app.setFont(defaultFont);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);


    engine.loadFromModule("playground", "Main");

    return app.exec();
}
