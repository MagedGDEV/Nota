#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <include/Driver.h>

int main(int argc, char *argv[])
{



    // Specifies the way of rendering
    // To allow use of GammaRay
    #ifdef __APPLE__
        qputenv("QT_QUICK_BACKEND", "software");
    #endif

    QGuiApplication app(argc, argv);

    app.setOrganizationName("Nota App");
    app.setOrganizationDomain("maged.work0@gmail.com");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    // Add the C++ class into QML
    Driver* driver = new Driver();
    QQmlContext* rootContext = engine.rootContext();
    rootContext->setContextProperty("Driver", driver);

    engine.loadFromModule("Nota", "Main");
    delete driver;
    return app.exec();
}
