cmake_minimum_required(VERSION 3.22.2)
project(MyProject VERSION 1.0.0)

#add_executable(cmake-good main.cpp)
add_executable(${PROJECT_NAME} main.cpp)


# This part does not work? What the? 
# Executable binary files will be installed (compiled and copied) to $CMAKE_INSTALL_PREFIX/bin
install(TARGETS ${PROJECT_NAME} DESTINATION bin)
# Source files will be copied to $CMAKE_INSTALL_PREFIX/src
install(FILES main.cpp DESTINATION src)


#$ cmake -DCMAKE_INSTALL_PREFIX=/HelloUnderworld ..
#$ # Specify the installation directory path
#$ make install DESTDIR=..

# cmake -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=/MyProject ..
# nmake install DESTDIR=..  or nmake DESTDIR=MyProject2 install

#//Install path prefix, prepended onto install directories.
#CMAKE_INSTALL_PREFIX:PATH=C:/Program Files (x86)/MyProject

#//Install path prefix, prepended onto install directories.
#CMAKE_INSTALL_PREFIX:PATH=/MyProject
