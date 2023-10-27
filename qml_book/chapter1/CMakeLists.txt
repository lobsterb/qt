project (chapter1)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED 
    COMPONENTS Quick
)

qt_standard_project_setup()

set (SOURCES 
    "src/main.cpp"
    )

qt_add_executable (${PROJECT_NAME} ${SOURCES})

qt_add_qml_module(${PROJECT_NAME}
    URI res
    VERSION 1.0
    QML_FILES 
        "ui/main.qml"
        "assets/images/background.png"
        "assets/images/blur.png"
        "assets/images/pinwheel.png"
        "assets/images/pole.png"
        
)

target_link_libraries(${PROJECT_NAME} 
    PRIVATE	
        Qt6::Quick
)