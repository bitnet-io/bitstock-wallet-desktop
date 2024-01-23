#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial-sodium::sodium" for configuration "Debug"
set_property(TARGET unofficial-sodium::sodium APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial-sodium::sodium PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "ASM;C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libsodium.a"
  )

list(APPEND _cmake_import_check_targets unofficial-sodium::sodium )
list(APPEND _cmake_import_check_files_for_unofficial-sodium::sodium "${_IMPORT_PREFIX}/debug/lib/libsodium.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)