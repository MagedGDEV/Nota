#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFont>
#include <QIcon>

#include <include/Client.h>

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
    app.setWindowIcon(QIcon(":/icons/app-icon.png"));

    QFont defaultFont ("Ubuntu", 12);
    app.setFont(defaultFont);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    // Add the C++ class into QML
    Client* client = new Client();
    QQmlContext* rootContext = engine.rootContext();
    rootContext->setContextProperty("Client", client);

    engine.loadFromModule("Nota", "Main");

    return app.exec();
    delete client;
}
