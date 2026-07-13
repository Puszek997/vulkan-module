include_guard(GLOBAL)

if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    set(
        compile_flags
        -pedantic-errors
        -pipe
        # -fstrict-flex-arrays=3
        # -fstack-protector-strong
        # -fno-common
        # -fno-rtti
        # -fsafe-buffer-usage-suggestions
        # -fcf-protection=full
        # -fstack-clash-protection
        # -fno-exceptions
    )
endif()
