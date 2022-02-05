project(HelloLibrary VERSION 1.3.9)

add_library(
		say-hello  #default is STATIC
		src/say-hello/hello.h
		src/say-hello/hello.cpp
		)
		
#target_include_directories(say_hello PUBLIC '${CMAKE_CURRENT_SOURCE_DIR}/src')
target_include_directories(say-hello PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)
#target_include_directories(say_hello PUBLIC '${CMAKE_CURRENT_SOURCE_DIR}/src/say_hello')
#target_include_directories(say-hello PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src/say_hello)


# ${CMAKE_CURRENT_SOURCE_DIR} == C:\Dev\CmakeTest\AddingSubdirectories\say_hello
# ${CMAKE_CURRENT_SOURCE_DIR}/src == C:\Dev\CmakeTest\AddingSubdirectories\say_hello\src

# add preprocessors 
# because this is set to PUBLIC, it gets propagated to anyone that links to it 
# if set to PRIVATE then the main() cannot use that preprocessor anymore 
# PRIVATE says only we receive the value 
# if set to INTERFACE then main() can use it. But say_hello cannot. 
# INTERFACE says only consumer receives the value 
target_compile_definitions(say-hello PUBLIC SAY_HELLO_VERSION=8)