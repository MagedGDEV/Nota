
#pragma once

#include <QObject>


class Driver: public QObject {

    Q_OBJECT

public:

    explicit Driver(QObject * parent = nullptr);
    Q_INVOKABLE void printHello();
};


