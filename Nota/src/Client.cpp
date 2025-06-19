#include "include/Client.h"

Client::Client(QObject* parent){
    mServer = new Server("NotaDataBase.db");
}

void Client::addTable(const QString& tableName){

    mServer->addTable(tableName);
}

Client::~Client(){
    if (mServer)
        delete mServer;
}
