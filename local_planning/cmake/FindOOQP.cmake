# TRY TO FIND THE INCLUDE DIRECTORY
find_path(OOQP_INCLUDE_DIR
QpGenData.h
HINTS ${PROJECT_SOURCE_DIR}/thirdparty/ooqp/include/ooqp
)

if(OOQP_INCLUDE_DIR)
  set(OOQP_FOUND_INCLUDE TRUE)
  set(OOQP_INCLUDE_DIRS
  ${OOQP_INCLUDE_DIR})
  message(STATUS "Found OOQP include dirs: ${OOQP_INCLUDE_DIRS}")
else()
  message(STATUS "Could not find OOQP include dir")
endif()

# TRY TO FIND THE LIBRARIES
set(OOQP_LIBS_LIST
  ooqpgensparse ooqpsparse ooqpgondzio ooqpbase ma27
)

set(OOQP_LIBRARIES)
set(OOQP_FOUND_LIBS TRUE)
foreach(LIB ${OOQP_LIBS_LIST})
  find_library(OOQP_LIB_${LIB}
    NAMES ${LIB}
    HINTS ${PROJECT_SOURCE_DIR}/thirdparty/ooqp/lib)
  if(OOQP_LIB_${LIB})
    set(OOQP_LIBRARIES ${OOQP_LIBRARIES} ${OOQP_LIB_${LIB}})
  else()
    set(OOQP_FOUND_LIBS FALSE)
  endif()
endforeach()

set(OOQP_LIBRARIES ${OOQP_LIBRARIES} blas)
set(OOQP_LIBRARIES ${OOQP_LIBRARIES} gfortran)

# print OOQP_LIBRARIES
if(OOQP_FOUND_LIBS)
  message(STATUS "Found OOQP libraries: ${OOQP_LIBRARIES}")
elseif()
  message(STATUS "Cound not find OOQP libraries")
endif()

# SUCCESS if BOTH THE LIBRARIES AND THE INCLUDE DIRECTORIES WERE FOUND
if(OOQP_FOUND_INCLUDE AND OOQP_FOUND_LIBS)
  set(OOQP_FOUND TRUE)
  message(STATUS "Found OOQP")
elseif()
  message(STATUS "Cound not find OOQP")
endif()

# 添加父目录到包含路径
get_filename_component(OOQP_PARENT_DIR ${OOQP_INCLUDE_DIR} DIRECTORY)
set(OOQP_INCLUDE_DIRS ${OOQP_INCLUDE_DIR} ${OOQP_PARENT_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OOQP
  REQUIRED_VARS OOQP_INCLUDE_DIR OOQP_LIBRARIES
)

mark_as_advanced(OOQP_INCLUDE_DIR OOQP_LIBRARIES)
