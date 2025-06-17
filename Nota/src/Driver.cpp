#include "include/Driver.h"
#include <QDebug>


Driver::Driver(QObject* parent) : QObject(parent){ }


void Driver::printHello() {
    qInfo() << "Hello World\n";
}
