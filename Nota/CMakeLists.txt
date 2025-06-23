cmake_minimum_required(VERSION 3.16)

project(Nota VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS
    Quick
    QuickControls2
    Sql)

qt_standard_project_setup(REQUIRES 6.5)


qt_add_executable(Nota
    main.cpp

    src/Server.cpp
    src/Client.cpp


    include/Server.h
    include/Client.h

)

set_source_files_properties(Theme.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
set(QT_QML_GENERATE_QMLLS_INI ON)

qt_add_qml_module(Nota
    URI Nota
    VERSION 1.0

    QML_FILES

        Main.qml
        # Components
        VerticalBarButton.qml
        Theme.qml
        # Pages
        SideBar.qml
        WorkspaceSection.qml
        MarkdownSection.qml

        # Notes workspace
        NotesWorkspace/NotesTextArea.qml
        NotesWorkspace/NotesToolBar.qml
        NotesWorkspace/NotesToolBarButton.qml
        NotesWorkspace/NotesCheckBox.qml
        NotesWorkspace/NotesCheckView.qml
        NotesWorkspace/NotesCheckToolBar.qml

    RESOURCES
        NotaDataBase.db
)

add_subdirectory(icons)
add_subdirectory(playground)


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(Nota PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appNota
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(Nota
    PRIVATE Qt6::Quick
    Qt6::QuickControls2
    Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS Nota
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
