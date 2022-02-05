
add_executable(cmake-good main.cpp) 

target_link_libraries(cmake-good PRIVATE say_hello)



#cmake_minimum_required(VERSION 3.22.2)
#project(MyProject VERSION 1.0.0)
#add_executable(cmake-good main.cpp hello.cpp) 
#add_subdirectory(say_hello)
