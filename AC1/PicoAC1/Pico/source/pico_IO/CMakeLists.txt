# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialise pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH $ENV{PICO_SDK_PATH})

set(PICO_BOARD pico CACHE STRING "Board type")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

if (PICO_SDK_VERSION_STRING VERSION_LESS "1.4.0")
  message(FATAL_ERROR "Raspberry Pi Pico SDK version 1.4.0 (or later) required. Your version is ${PICO_SDK_VERSION_STRING}")
endif()

project(pico_IO C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1

add_executable(
    ${PROJECT_NAME}
    main.c 
    ac1_usb_kbd.c
    hw_config.c
    ac1_zcom.c
    ac1_rtc.c
    ac1_config.c
    ac1_picom.c
    ac1_printfile.c
    ac1_sdcard.c
)

pico_generate_pio_header(pico_IO ${CMAKE_CURRENT_LIST_DIR}/zcom.pio)

# Tell CMake where to find other source code
add_subdirectory(FatFs_SPI build)

# Add the standard library to the build
target_link_libraries(
  ${PROJECT_NAME}
  pico_stdlib
  tinyusb_host 
  tinyusb_board
  FatFs_SPI
  pico_multicore
  hardware_i2c
  hardware_flash
  hardware_pio
)

pico_set_program_name(${PROJECT_NAME} "pico_IO")
pico_set_program_version(${PROJECT_NAME} "0.1")

pico_enable_stdio_uart(${PROJECT_NAME} 0)
pico_enable_stdio_usb(${PROJECT_NAME} 0)


#target_link_libraries(host_cdc_msc_hid PUBLIC pico_stdlib tinyusb_host tinyusb_board)

# Add the standard include files to the build
target_include_directories(
  ${PROJECT_NAME} PRIVATE
#  host_cdc_msc_hid PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}
#  ${CMAKE_CURRENT_LIST_DIR}/.. # for our common lwipopts or any other standard includes, if required
)

# Add any user requested libraries
target_link_libraries(
  ${PROJECT_NAME} 
)    

pico_add_extra_outputs(${PROJECT_NAME})

