# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(engine3d_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(engine3d_FRAMEWORKS_FOUND_RELEASE "${engine3d_FRAMEWORKS_RELEASE}" "${engine3d_FRAMEWORK_DIRS_RELEASE}")

set(engine3d_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET engine3d_DEPS_TARGET)
    add_library(engine3d_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET engine3d_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${engine3d_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${engine3d_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:glfw;glad::glad;spdlog::spdlog;fmt::fmt;glm::glm;yaml-cpp::yaml-cpp;box2d::box2d>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### engine3d_DEPS_TARGET to all of them
conan_package_library_targets("${engine3d_LIBS_RELEASE}"    # libraries
                              "${engine3d_LIB_DIRS_RELEASE}" # package_libdir
                              "${engine3d_BIN_DIRS_RELEASE}" # package_bindir
                              "${engine3d_LIBRARY_TYPE_RELEASE}"
                              "${engine3d_IS_HOST_WINDOWS_RELEASE}"
                              engine3d_DEPS_TARGET
                              engine3d_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "engine3d"    # package_name
                              "${engine3d_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${engine3d_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET engine3d::engine3d
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${engine3d_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${engine3d_LIBRARIES_TARGETS}>
                 )

    if("${engine3d_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET engine3d::engine3d
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     engine3d_DEPS_TARGET)
    endif()

    set_property(TARGET engine3d::engine3d
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${engine3d_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET engine3d::engine3d
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${engine3d_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET engine3d::engine3d
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${engine3d_LIB_DIRS_RELEASE}>)
    set_property(TARGET engine3d::engine3d
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${engine3d_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET engine3d::engine3d
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${engine3d_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(engine3d_LIBRARIES_RELEASE engine3d::engine3d)
