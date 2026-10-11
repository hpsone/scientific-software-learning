cmake_minimum_required(VERSION 3.20)
project(sci_learning LANGUAGES Fortran)
enable_testing()
add_test(NAME run_main COMMAND main)
add_library(mathlib SHARED src/mathlib.f90)
add_executable(main src/main.f90)
target_link_libraries(main PRIVATE mathlib)
set(CMAKE_Fortran_FLAGS_DEBUG "-g -O0 -Wall -Wextra -fcheck=all")

