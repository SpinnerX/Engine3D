########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(engine3d_COMPONENT_NAMES "")
if(DEFINED engine3d_FIND_DEPENDENCY_NAMES)
  list(APPEND engine3d_FIND_DEPENDENCY_NAMES glfw3 glad spdlog fmt glm yaml-cpp box2d)
  list(REMOVE_DUPLICATES engine3d_FIND_DEPENDENCY_NAMES)
else()
  set(engine3d_FIND_DEPENDENCY_NAMES glfw3 glad spdlog fmt glm yaml-cpp box2d)
endif()
set(glfw3_FIND_MODE "NO_MODULE")
set(glad_FIND_MODE "NO_MODULE")
set(spdlog_FIND_MODE "NO_MODULE")
set(fmt_FIND_MODE "NO_MODULE")
set(glm_FIND_MODE "NO_MODULE")
set(yaml-cpp_FIND_MODE "NO_MODULE")
set(box2d_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(engine3d_PACKAGE_FOLDER_RELEASE "C:/Users/heraa/.conan2/p/b/engine3da0c0ab37e6/p")
set(engine3d_BUILD_MODULES_PATHS_RELEASE )


set(engine3d_INCLUDE_DIRS_RELEASE "${engine3d_PACKAGE_FOLDER_RELEASE}/./"
			"${engine3d_PACKAGE_FOLDER_RELEASE}/./engine3d")
set(engine3d_RES_DIRS_RELEASE )
set(engine3d_DEFINITIONS_RELEASE )
set(engine3d_SHARED_LINK_FLAGS_RELEASE )
set(engine3d_EXE_LINK_FLAGS_RELEASE )
set(engine3d_OBJECTS_RELEASE )
set(engine3d_COMPILE_DEFINITIONS_RELEASE )
set(engine3d_COMPILE_OPTIONS_C_RELEASE )
set(engine3d_COMPILE_OPTIONS_CXX_RELEASE )
set(engine3d_LIB_DIRS_RELEASE "${engine3d_PACKAGE_FOLDER_RELEASE}/lib")
set(engine3d_BIN_DIRS_RELEASE )
set(engine3d_LIBRARY_TYPE_RELEASE STATIC)
set(engine3d_IS_HOST_WINDOWS_RELEASE 1)
set(engine3d_LIBS_RELEASE engine3d)
set(engine3d_SYSTEM_LIBS_RELEASE )
set(engine3d_FRAMEWORK_DIRS_RELEASE )
set(engine3d_FRAMEWORKS_RELEASE )
set(engine3d_BUILD_DIRS_RELEASE )
set(engine3d_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(engine3d_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${engine3d_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${engine3d_COMPILE_OPTIONS_C_RELEASE}>")
set(engine3d_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${engine3d_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${engine3d_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${engine3d_EXE_LINK_FLAGS_RELEASE}>")


set(engine3d_COMPONENTS_RELEASE )