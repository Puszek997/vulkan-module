include_guard(GLOBAL)

if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    set(
        compile_flags
        -pedantic-errors
        -pipe
        -fno-common

        # -fno-rtti
        # -fsafe-buffer-usage-suggestions
        # -fno-exceptions

        #ssf
        -fstrict-flex-arrays=3
        # -fstack-clash-protection
        # -fstack-protector-strong
        # -fcf-protection=full

        # -Wl,-z,nodlopen -Wl,-z,noexecstack \
        # -Wl,-z,relro -Wl,-z,now \
        # -Wl,--as-needed -Wl,--no-copy-dt-needed-entries
        # -D_GLIBCXX_ASSERTIONS \
        # -D_LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_FAST \

        #redhat
        # -mshstk
        # -fsplit-stack
        # -fstack-limit-register
        # -fstack-limit-symbol
        # -fno-stack-array
    )
endif()
