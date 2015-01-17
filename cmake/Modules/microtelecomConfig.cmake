INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_MICROTELECOM microtelecom)

FIND_PATH(
    MICROTELECOM_INCLUDE_DIRS
    NAMES microtelecom/api.h
    HINTS $ENV{MICROTELECOM_DIR}/include
        ${PC_MICROTELECOM_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    MICROTELECOM_LIBRARIES
    NAMES gnuradio-microtelecom
    HINTS $ENV{MICROTELECOM_DIR}/lib
        ${PC_MICROTELECOM_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(MICROTELECOM DEFAULT_MSG MICROTELECOM_LIBRARIES MICROTELECOM_INCLUDE_DIRS)
MARK_AS_ADVANCED(MICROTELECOM_LIBRARIES MICROTELECOM_INCLUDE_DIRS)
