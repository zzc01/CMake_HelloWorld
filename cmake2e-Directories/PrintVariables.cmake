function(print_variables)
	# the root of the cmake. does not change  
	message(STATUS "The CMAKE SOURCE directory is ${CMAKE_SOURCE_DIR}")
	message(STATUS "The CMAKE BINARY directory is ${CMAKE_BINARY_DIR}")
	# changes when use project()
	message(STATUS "The CMAKE SOURCE directory of the '${PROJECT_NAME}' project is ${PROJECT_SOURCE_DIR}")
	message(STATUS "The CMAKE BINARY directory of the '${PROJECT_NAME}' project is ${PROJECT_BINARY_DIR}")
	message(STATUS "The version of the current project is ${PROJECT_VERSION}")
	# changes when use add_subdirectory() 
	message(STATUS "The current SOURCE directory is ${CMAKE_CURRENT_SOURCE_DIR}")
	message(STATUS "The current BINARY directory is ${CMAKE_CURRENT_BINARY_DIR}")
	# changes when w.r.t scripts being evaluated 
	message(STATUS "The current script file is ${CMAKE_CURRENT_LIST_FILE}")
	message(STATUS "The current script directory is ${CMAKE_CURRENT_LIST_DIR}")
endfunction()

#run cmake in scripting mode 
#C:\Dev\CmakeTest\SourceBinaryDirectories2e>cmake -P PrintVariables.cmake
#C:\Dev\CmakeTest\SourceBinaryDirectories2e\build>cmake -P../ PrintVariables.cmake
print_variables()