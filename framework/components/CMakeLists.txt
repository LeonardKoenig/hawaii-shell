set(FILES
    qmldir
    Icon.qml
    Loadable.qml
    NoiseBackground.qml
    Showable.qml
    SmoothFadeImage.qml
    SmoothFadeLoader.qml
)

install(FILES ${FILES}
        DESTINATION ${QML_INSTALL_DIR}/Hawaii/Components)

set(LISTITEMS_FILES
    ListItems/Base.qml
    ListItems/Empty.qml
    ListItems/Subtitled.qml
    ListItems/Standard.qml
    ListItems/Highlight.qml
    ListItems/qmldir
)

install(FILES ${LISTITEMS_FILES}
        DESTINATION ${QML_INSTALL_DIR}/Hawaii/Components/ListItems)
