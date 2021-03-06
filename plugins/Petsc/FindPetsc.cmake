# Needs environmental variables
#   PETSC_ARCH
#   PETSC_DIR
# Sets
#   PETSC_INCLUDE_DIR
#   PETSC_LIBS
#   CF_HAVE_PETSC
#

SET_TRIAL_INCLUDE_PATH( "" )
ADD_TRIAL_INCLUDE_PATH( ${PETSC_DIR}/include )
ADD_TRIAL_INCLUDE_PATH( $ENV{PETSC_DIR}/include )

FIND_PATH( PETSC_INC_DIR petscconf.h PATHS ${TRIAL_INCLUDE_PATHS} NO_DEFAULT_PATH )
FIND_PATH( PETSC_INC_DIR petscconf.h HINTS /usr/include /usr/lib PATH_SUFFIXES petscdir/3.0.0/include )

LIST ( APPEND PETSC_INCLUDE_DIR ${PETSC_INC_DIR} )

SET_TRIAL_LIBRARY_PATH( "" )
ADD_TRIAL_LIBRARY_PATH( ${PETSC_DIR}/lib )
ADD_TRIAL_LIBRARY_PATH( $ENV{PETSC_DIR}/lib )

IF( CF_ENABLE_STATIC )
    SET(CMAKE_FIND_LIBRARY_SUFFIXES .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
ENDIF( CF_ENABLE_STATIC )

#FIND_LIBRARY(PETSC_KSP_LIB petscksp ${TRIAL_LIBRARY_PATHS}  NO_DEFAULT_PATH)
#FIND_LIBRARY(PETSC_KSP_LIB petscksp )

#FIND_LIBRARY(PETSC_SNES_LIB petscsnes ${TRIAL_LIBRARY_PATHS}  NO_DEFAULT_PATH)
#FIND_LIBRARY(PETSC_SNES_LIB petscsnes )

#FIND_LIBRARY(PETSC_CDM_LIB petscdm ${TRIAL_LIBRARY_PATHS}  NO_DEFAULT_PATH)
#FIND_LIBRARY(PETSC_CDM_LIB petscdm )

#FIND_LIBRARY(PETSC_MAT_LIB petscmat ${TRIAL_LIBRARY_PATHS}  NO_DEFAULT_PATH)
#FIND_LIBRARY(PETSC_MAT_LIB petscmat )

#FIND_LIBRARY(PETSC_VEC_LIB petscvec ${TRIAL_LIBRARY_PATHS}  NO_DEFAULT_PATH)
#FIND_LIBRARY(PETSC_VEC_LIB petscvec )

FIND_LIBRARY(PETSC_LIBRARY ${CF_LIBPETSC_NAME} ${TRIAL_LIBRARY_PATHS}  NO_DEFAULT_PATH)
FIND_LIBRARY(PETSC_LIBRARY ${CF_LIBPETSC_NAME} )

#LIST ( APPEND PETSC_LIBRARIES ${PETSC_KSP_LIB} ${PETSC_SNES_LIB} ${PETSC_CDM_LIB} ${PETSC_MAT_LIB} ${PETSC_VEC_LIB} ${PETSC_LIBRARY} )
#LIST ( APPEND PETSC_LIBRARIES ${PETSC_LIBRARY} )
LIST ( APPEND PETSC_LIBRARIES ${PETSC_LIBRARY} ${CF_LIBPETSC_DEPS_PATHS} )

IF(PETSC_INCLUDE_DIR AND PETSC_LIBRARIES)
  SET(CF_HAVE_PETSC 1 CACHE BOOL "Found Petsc library")
ELSE()
  SET(CF_HAVE_PETSC 0 CACHE BOOL "Not found Petsc library")
ENDIF()

MARK_AS_ADVANCED (
  PETSC_INCLUDE_DIR
  PETSC_LIBRARIES
  CF_HAVE_PETSC
  PETSC_BMAKE_DIR
  PETSC_INC_DIR
#  PETSC_KSP_LIB
#  PETSC_SNES_LIB
#  PETSC_CDM_LIB
#  PETSC_MAT_LIB
#  PETSC_VEC_LIB
  PETSC_LIBRARY
)

LOG ( "CF_HAVE_PETSC: [${CF_HAVE_PETSC}]" )
IF(CF_HAVE_PETSC)
   LOG ( "  PETSC_INCLUDE_DIR: [${PETSC_INCLUDE_DIR}]" )
   LOG ( "  PETSC_LIBRARIES:   [${PETSC_LIBRARIES}]" )
ENDIF()
