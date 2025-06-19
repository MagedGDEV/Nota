#include "include/Server.h"

#include <QDebug>


Server::Server(const QString& databaseName, QObject* parent) : QObject(parent){

    connectDB(databaseName);
}


bool Server::addTable (const QString& tableName){
    qInfo() << "Adding table " + tableName + "....";


    // Successfully Added
    return true;
}


void Server::connectDB(const QString& databaseName) {
    mDataBase = QSqlDatabase::addDatabase("QSQLITE");
    mDataBase.setDatabaseName(databaseName);
    if (mDataBase.open())
        qInfo() << "The database connected successfully";
    else
        qInfo() << "The database failed to connect: " << mDataBase.lastError().text();
}




