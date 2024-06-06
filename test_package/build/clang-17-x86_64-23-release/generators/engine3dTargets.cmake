# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/engine3d-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${engine3d_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${engine3d_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET engine3d::engine3d)
    add_library(engine3d::engine3d INTERFACE IMPORTED)
    message(${engine3d_MESSAGE_MODE} "Conan: Target declared 'engine3d::engine3d'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/engine3d-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()