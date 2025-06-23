#pragma once

#include <QObject>

#include "include/Server.h"

class Client: public QObject {

    Q_OBJECT

public:
    explicit Client(QObject* parent = nullptr);
    Q_INVOKABLE void addTable(const QString& tableName);
    ~Client();
private:

    Server* mServer;


};
