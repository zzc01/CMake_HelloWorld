cmake_minimum_required(VERSION 3.22.2)
project(MyProject VERSION 1.0.0)

# need to add say_hello before hello_ext
# because in hello_exe it depends on say_hello 
add_subdirectory(say_hello)
add_subdirectory(hello_exe)

