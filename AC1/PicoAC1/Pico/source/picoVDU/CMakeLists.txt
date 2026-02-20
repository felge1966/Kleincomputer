
cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialise pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH $ENV{PICO_SDK_PATH})

set(PICO_BOARD pico CACHE STRING "Board type")

# Pull in  Pico SDK (must be before project)
include(pico_sdk_import.cmake)

if (PICO_SDK_VERSION_STRING VERSION_LESS "1.4.0")
  message(FATAL_ERROR "Raspberry Pi Pico SDK version 1.4.0 (or later) required. Your version is ${PICO_SDK_VERSION_STRING}")
endif()

project(picoVDU C CXX ASM)

# Initialise the Pico SDK
pico_sdk_init()

add_subdirectory(vga)

add_executable(
  ${PROJECT_NAME} 
  main.c 
  ac1_graphics.c
  ac1_picom.c
  ac1_statusline.c
)

pico_set_program_name(${PROJECT_NAME} "picoVDU")
pico_set_program_version(${PROJECT_NAME} "0.1")

pico_enable_stdio_uart(${PROJECT_NAME} 0)
pico_enable_stdio_usb(${PROJECT_NAME} 0)

# Add the standard include files to the build
target_include_directories(
  ${PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}
  ${CMAKE_CURRENT_LIST_DIR}/.. # for our common lwipopts or any other standard includes, if required
)

# Add any user requested libraries
target_link_libraries(
    ${PROJECT_NAME} 
    pico_stdlib 
    pico_multicore
    vga
    hardware_i2c
    pico_i2c_slave
)

pico_add_extra_outputs(${PROJECT_NAME})
