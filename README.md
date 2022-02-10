# CMake_HelloWorld
 
## Notes
#### [cmake0b-CMakeLists](/cmake0b-CMakeLists)
* build/cmake .. and build/cmake –build . <br/>
* cmake_minimum_required() and project() 

#### [cmake0d-VisualCppWithoutVisualStudios](/cmake0d-VisualCppWithoutVisualStudio)
* Talked about compiler and linker of Visual Cpp 
* Build Visual Studio project using cmake command line (without using Visual Studio) 

#### [cmake1a-AddingExecutable](/cmake1a-AddingExecutable)
* make -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=/MyProject ..
* nmake install DESTDIR=.. or nmake DESTDIR=MyProject install
* add_executable() and install()

#### [cmake1b-AddLibrary](/cmake1b-AddLibrary)
* add_library() and target_link_libraries() 

#### [cmake1c-Subdirectories](/cmake1c-Subdirectories)
* add_subdirectory() and target_compile_definitions()
* target_include_directories(say_hello PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

#### [cmake2a-Scripting](/cmake2a-Scripting)
* message(STATUS "...") and set(VARIABLE_NAME "value")
* Concept of TARGET

#### [cmake2b-ControlFlow](/cmake2b-ControlFlow)
* if(), else(), endif(), endif(), STREQUAL, AND,  
* while(), endwhile(), LESS 
* foreach, endforeach(), IN ITEMS, RANGE 

#### [cmake2c-FunctionsList](/cmake2c-FunctionsList)
* set_property(GLOBAL), DIRECTORY, get_cmake_property() 
* Property look a bit like a list of variables. Property can declare as GLOBAL. Variable can pass by reference. 
* function(), ARGV, ARGN. Variable can pass by reference. 
* Arithmetic on variables 

#### [cmake2d-AdvancedFunctions](/cmake2d-AdvancedFunctions)
* *.cmake, resource library, tests  
* option, args, list_args, PASS_REGX  

#### [cmake2e-Directories](/cmake2e-Directories)
* include(PrintVariables.cmake) 
* ${CMAKE_SOURCE_DIR}, ${PROJECT_SOURCE_DIR}, ${CMAKE_CURRENT_SOURCE_DIR}, ${CMAKE_CURRENT_LIST_FILE}
 
## References 
* How to CMake Good https://www.youtube.com/watch?v=_yFPO1ofyF0&list=PLK6MXr8gasrGmIiSuVQXpfFuE1uPT615s
* https://github.com/vector-of-bool/cmrc/tree/master/tests
* https://cmake.org/cmake/help/latest/index.html
* https://stackoverflow.com/questions/25941536/what-is-a-cmake-generator
* https://raw.githubusercontent.com/leimao/CMake_Examples
 
 
