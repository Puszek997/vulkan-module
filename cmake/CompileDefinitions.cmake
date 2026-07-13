include_guard(GLOBAL)

if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    set(
        compile_definitions
        $<$<CONFIG:Release>:-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3>
    )
endif()
