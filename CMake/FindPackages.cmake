# generated by Buildyard, do not edit.

include(System)
list(APPEND FIND_PACKAGES_DEFINES ${SYSTEM})

find_package(OpenGL )
if(OpenGL_FOUND)
  set(OpenGL_name OpenGL)
endif()
if(OPENGL_FOUND)
  set(OpenGL_name OPENGL)
endif()
if(OpenGL_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_OPENGL)
  link_directories(${${OpenGL_name}_LIBRARY_DIRS})
  if(NOT "${${OpenGL_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${OpenGL_name}_INCLUDE_DIRS})
  endif()
endif()

find_package(Qt4 4.6 COMPONENTS QtNetwork)
if(Qt4_FOUND)
  set(Qt4_name Qt4)
endif()
if(QT4_FOUND)
  set(Qt4_name QT4)
endif()
if(Qt4_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_QT4)
  link_directories(${${Qt4_name}_LIBRARY_DIRS})
  if(NOT "${${Qt4_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${Qt4_name}_INCLUDE_DIRS})
  endif()
endif()

find_package(X11 )
if(X11_FOUND)
  set(X11_name X11)
endif()
if(X11_FOUND)
  set(X11_name X11)
endif()
if(X11_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_X11)
  link_directories(${${X11_name}_LIBRARY_DIRS})
  if(NOT "${${X11_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${X11_name}_INCLUDE_DIRS})
  endif()
endif()

find_package(Lunchbox 1.7.5 REQUIRED)
if(Lunchbox_FOUND)
  set(Lunchbox_name Lunchbox)
endif()
if(LUNCHBOX_FOUND)
  set(Lunchbox_name LUNCHBOX)
endif()
if(Lunchbox_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_LUNCHBOX)
  link_directories(${${Lunchbox_name}_LIBRARY_DIRS})
  if(NOT "${${Lunchbox_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${Lunchbox_name}_INCLUDE_DIRS})
  endif()
endif()

find_package(Boost 1.41.0 REQUIRED program_options regex)
if(Boost_FOUND)
  set(Boost_name Boost)
endif()
if(BOOST_FOUND)
  set(Boost_name BOOST)
endif()
if(Boost_name)
  list(APPEND FIND_PACKAGES_DEFINES HWSD_USE_BOOST)
  link_directories(${${Boost_name}_LIBRARY_DIRS})
  if(NOT "SYSTEM ${${Boost_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(SYSTEM ${${Boost_name}_INCLUDE_DIRS})
  endif()
endif()


if(EXISTS ${CMAKE_SOURCE_DIR}/CMake/FindPackagesPost.cmake)
  include(${CMAKE_SOURCE_DIR}/CMake/FindPackagesPost.cmake)
endif()

set(HWSD_BUILD_DEBS libavahi-compat-libdnssd-dev;libboost-program-options-dev;libboost-regex-dev;libboost-serialization-dev;libgl1-mesa-dev;libhwloc-dev;libqt4-dev;libx11-dev)

set(HWSD_DEPENDS OpenGL;Qt4;X11;Lunchbox;Boost)

# Write defines.h and options.cmake
if(NOT PROJECT_INCLUDE_NAME)
  set(PROJECT_INCLUDE_NAME ${CMAKE_PROJECT_NAME})
endif()
if(NOT OPTIONS_CMAKE)
  set(OPTIONS_CMAKE ${CMAKE_BINARY_DIR}/options.cmake)
endif()
set(DEFINES_FILE "${CMAKE_BINARY_DIR}/include/${PROJECT_INCLUDE_NAME}/defines${SYSTEM}.h")
set(DEFINES_FILE_IN ${DEFINES_FILE}.in)
file(WRITE ${DEFINES_FILE_IN}
  "// generated by CMake/FindPackages.cmake, do not edit.\n\n"
  "#ifndef ${CMAKE_PROJECT_NAME}_DEFINES_${SYSTEM}_H\n"
  "#define ${CMAKE_PROJECT_NAME}_DEFINES_${SYSTEM}_H\n\n")
file(WRITE ${OPTIONS_CMAKE} "# Optional modules enabled during build\n")
foreach(DEF ${FIND_PACKAGES_DEFINES})
  add_definitions(-D${DEF})
  file(APPEND ${DEFINES_FILE_IN}
  "#ifndef ${DEF}\n"
  "#  define ${DEF}\n"
  "#endif\n")
if(NOT DEF STREQUAL SYSTEM)
  file(APPEND ${OPTIONS_CMAKE} "set(${DEF} ON)\n")
endif()
endforeach()
file(APPEND ${DEFINES_FILE_IN}
  "\n#endif\n")

include(UpdateFile)
update_file(${DEFINES_FILE_IN} ${DEFINES_FILE})
