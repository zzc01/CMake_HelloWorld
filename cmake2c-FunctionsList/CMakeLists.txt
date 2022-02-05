# go to build/
# enter cmake .. 
# enter cmake --build . 

cmake_minimum_required(VERSION 3.22.2)
project(MyProject VERSION 1.1.2)

# this is a list of values 
# all is string arguments 
# can replace GLOBAL with DIRECTORY .. this is like enum 
# GLOBAL and STATUS and DIRECTORY changes the function mode 
set_property(
	GLOBAL
	#DIRECTORY
	PROPERTY FOO
	1
	2
	3
	)


get_cmake_property(foo_value FOO)
# STATUS is also like enum representing the mode 
message(STATUS "Value is ${foo_value}")


set(my_list 1 2 3)
set(target GLOBAL)
set_property(
	#GLOBAL
	${target}
	PROPERTY FOO2
	${my_list}
	)
get_cmake_property(foo_value2 FOO2)
message(STATUS "Value is ${foo_value2}")


set(my_list 1 2 3 4)
set(target DIRECTORY)
set_property(
	"${target}"
	PROPERTY FOO2
	${my_list}
	)
get_property(foo_value2 "${target}" PROPERTY FOO2)
message(STATUS "Value is ${foo_value2}")



set(my_list 1 2 3 4 5) 
set(target DIRECTORY ${PROJECT_SOURCE_DIR}) 
set_property(
	${target}
	PROPERTY FOO2
	${my_list}
	)
get_property(foo_value2 ${target} PROPERTY FOO2)
message(STATUS "Value is ${foo_value2}")


function(function_name first_arg second third fourth)
	message(STATUS "Function called: ${first_arg}!")
	message(STATUS "Function called: ${second}!")
	message(STATUS "Function called: ${third}!")
	message(STATUS "Function called: ${fourth}!")
endfunction()

function_name(1 2 3 4)
#function_name(2)
#function_name(3)

function(function_name)
	foreach(arg IN LISTS ARGN)
		message(STATUS "Function called: ${arg}!")
	endforeach()
endfunction()
function_name(1 2 3 4 6)


#ARGN is the variables that are not been bound 
#ARGV is all the variable passed to the function 
function(function_name first second third)
	foreach(arg IN LISTS ARGN)
		message(STATUS "Function called ARGN: ${arg}!")
	endforeach()
	foreach(arg IN LISTS ARGV)
		message(STATUS "Function called ARGV: ${arg}!")
	endforeach()
endfunction()
function_name(1 2 3 4 6)

# demonstrate the scope of the variable  
function(function_name)
	message(STATUS "Global var is 1: ${MY_GLOBAL_VAR}!")
	#set(MY_GLOBAL_VAR 100) # changes current scope not parent scope 
	set(MY_GLOBAL_VAR 100 PARENT_SCOPE) # change parent scope not current scope 
	# this can help return values 
	message(STATUS "Global var is 2: ${MY_GLOBAL_VAR}!")
endfunction()
set(MY_GLOBAL_VAR Meow)
function_name()
message(STATUS "Global var is 1: ${MY_GLOBAL_VAR}!")


# the ${} is dereference 
function(increment var)
	message(STATUS "Value before increment is ${${var}}")
	math(EXPR new_value "${${var}}+1")
	message(STATUS "Value after increment is ${new_value}")
	set("${var}" "${new_value}" PARENT_SCOPE)
endfunction()
set(value 14)
increment(value)
increment(value)
increment(value)
message(STATUS "Final value is ${value}")


function(sum out a b)
	math(EXPR ret "${a}+${b}")
	set("${out}" "${ret}" PARENT_SCOPE)
endfunction()

sum(value 3 5)
message(STATUS "Final value is ${value}")


