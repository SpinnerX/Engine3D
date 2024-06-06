# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(box2d_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(box2d_FRAMEWORKS_FOUND_RELEASE "${box2d_FRAMEWORKS_RELEASE}" "${box2d_FRAMEWORK_DIRS_RELEASE}")

set(box2d_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET box2d_DEPS_TARGET)
    add_library(box2d_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET box2d_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${box2d_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${box2d_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### box2d_DEPS_TARGET to all of them
conan_package_library_targets("${box2d_LIBS_RELEASE}"    # libraries
                              "${box2d_LIB_DIRS_RELEASE}" # package_libdir
                              "${box2d_BIN_DIRS_RELEASE}" # package_bindir
                              "${box2d_LIBRARY_TYPE_RELEASE}"
                              "${box2d_IS_HOST_WINDOWS_RELEASE}"
                              box2d_DEPS_TARGET
                              box2d_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "box2d"    # package_name
                              "${box2d_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${box2d_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET box2d::box2d
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${box2d_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${box2d_LIBRARIES_TARGETS}>
                 )

    if("${box2d_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET box2d::box2d
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     box2d_DEPS_TARGET)
    endif()

    set_property(TARGET box2d::box2d
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${box2d_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET box2d::box2d
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${box2d_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET box2d::box2d
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${box2d_LIB_DIRS_RELEASE}>)
    set_property(TARGET box2d::box2d
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${box2d_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET box2d::box2d
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${box2d_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(box2d_LIBRARIES_RELEASE box2d::box2d)
