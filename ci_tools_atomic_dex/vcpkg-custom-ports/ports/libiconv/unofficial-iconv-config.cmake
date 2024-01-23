if (NOT TARGET unofficial::iconv::libiconv)
    add_library(unofficial::iconv::libcharset INTERFACE IMPORTED)
    add_library(unofficial::iconv::libiconv INTERFACE IMPORTED)
    if(APPLE)
        set_property(TARGET unofficial::iconv::libcharset PROPERTY INTERFACE_LINK_LIBRARIES "charset;unofficial::iconv::libiconv")
        set_property(TARGET unofficial::iconv::libiconv PROPERTY INTERFACE_LINK_LIBRARIES "iconv")
    endif()
endif()
