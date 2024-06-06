# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/box2d-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${box2d_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${box2d_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET box2d::box2d)
    add_library(box2d::box2d INTERFACE IMPORTED)
    message(${box2d_MESSAGE_MODE} "Conan: Target declared 'box2d::box2d'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/box2d-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()