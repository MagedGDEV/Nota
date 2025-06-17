#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{



    // Specifies the way of rendering
    // To allow use of GammaRay
    #ifdef __APPLE__
        qputenv("QT_QUICK_BACKEND", "software");
    #endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Nota", "Main");

    return app.exec();
}
