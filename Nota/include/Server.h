
#pragma once

#include <QObject>
#include <QSqlDatabase>
#include <QSqlError>

class Server: public QObject {

    Q_OBJECT

public:
    explicit Server(const QString& databaseName, QObject * parent = nullptr);
    bool addTable (const QString& tableName);
private:

    QSqlDatabase mDataBase;

    void connectDB(const QString& databaseName);

};


