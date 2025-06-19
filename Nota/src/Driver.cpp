#include "include/Driver.h"

#include <QDebug>


Driver::Driver(QObject* parent) : QObject(parent){

    connectDB();
}



void Driver::connectDB() {
    mDataBase = QSqlDatabase::addDatabase("QSQLITE");
    mDataBase.setDatabaseName("NotaDataBase.db");
    if (mDataBase.open())
        qInfo() << "The database connected successfully";
    else
        qInfo() << "The database failed to connect: " << mDataBase.lastError().text();
}
