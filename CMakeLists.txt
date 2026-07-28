cmake_minimum_required(VERSION 4.4.1)

list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

project(
    vulkan-module
    VERSION      0.1.0
    SPDX_LICENSE ""
    DESCRIPTION  ""
    HOMEPAGE_URL ""
    LANGUAGES    CXX
)

find_package(Vulkan 1.4.350 REQUIRED)

add_library(${PROJECT_NAME})

include(CheckIPOSupported)
check_ipo_supported(RESULT result OUTPUT ipo_output LANGUAGES CXX)
if(result)
    set_property(
        TARGET
        ${PROJECT_NAME}
        PROPERTY
        INTERPROCEDURAL_OPTIMIZATION_RELEASE ON
    )
else()
    message(
        WARNING
        "IPO is not supported: ${ipo_output}"
        "IPO link options will not be passed to linker"
    )
endif()

set_target_properties(
    ${PROJECT_NAME}
    PROPERTIES
    CXX_STANDARD              26
    CXX_STANDARD_REQUIRED     ON
    CXX_EXTENSIONS            OFF
    CXX_VISIBILITY_PRESET     hidden
    VISIBILITY_INLINES_HIDDEN ON
    COMPILE_WARNING_AS_ERROR  ON
    POSITION_INDEPENDENT_CODE ON
    CXX_MODULE_STD            ON
)

target_sources(
    ${PROJECT_NAME}
    PUBLIC
    FILE_SET CXX_MODULES
    BASE_DIRS
        ${Vulkan_INCLUDE_DIR}
    FILES
        ${Vulkan_INCLUDE_DIR}/vulkan/vulkan.cppm
        ${Vulkan_INCLUDE_DIR}/vulkan/vulkan_video.cppm
)

include(CompileDefinitions)
include(CompileFlags)
include(CompileWarnings)
target_compile_options(
    ${PROJECT_NAME}
    PRIVATE
    ${compile_definitions}
    ${compile_flags}
    ${compile_warnings}
)

target_compile_definitions(
    ${PROJECT_NAME}
    PRIVATE
    VK_NO_PROTOTYPES
    VULKAN_HPP_ASSERT_ON_RESULT=
    VULKAN_HPP_FLAGS_MASK_TYPE_AS_PUBLIC
    VULKAN_HPP_HANDLE_ERROR_OUT_OF_DATE_AS_SUCCESS
    VULKAN_HPP_NO_CONSTRUCTORS
    VULKAN_HPP_NO_EXCEPTIONS
    VULKAN_HPP_NO_SETTERS
    VULKAN_HPP_NO_SMART_HANDLE
    VULKAN_HPP_USE_REFLECT
    VULKAN_HPP_USE_STD_EXPECTED
    VULKAN_HPP_CXX_MODULE_EXPERIMENTAL_WARNING
)

include(GNUInstallDirs)
install(
    TARGETS
    ${PROJECT_NAME}
    ARCHIVE DESTINATION "$<CONFIG>/${CMAKE_INSTALL_LIBDIR}"
)
