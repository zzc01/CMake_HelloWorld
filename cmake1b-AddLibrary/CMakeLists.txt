cmake_minimum_required(VERSION 3.22.2)
project(MyProject VERSION 1.0.0)

#add_executable(cmake-good main.cpp hello.cpp) 

add_library(
		say_hello  #default is STATIC or SHARED or MODULE
		hello.h
		hello.cpp
		)

add_executable(cmake-good main.cpp) 

target_link_libraries(cmake-good PRIVATE say_hello)

# cmake -D BUILD_SHARED_LIBS=TRUE .
#C:\Dev\CmakeTest\AddingALibrary\build>cmake -D BUILD_SHARED_LIBS=FALSE .