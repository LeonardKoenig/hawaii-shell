set(FILES
    qmldir
    Calendar.qml
    Heading.qml
    TextField.qml
    ToolButton.qml
    SidePanel.qml
)

install(FILES ${FILES}
        DESTINATION ${QML_INSTALL_DIR}/Hawaii/Controls)
