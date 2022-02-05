# go to build/
# enter cmake .. 
# enter cmake --build . 

cmake_minimum_required(VERSION 3.22.2)
project(MyProject VERSION 1.1.2)

#variables
set(MY_VARIABLE "a variable")
message(STATUS "The message is: ${MY_VARIABLE}")

if("FALSE")
	message(STATUS "Condition was met")
else()
	message(STATUS "Condition failed")
endif()


set(my_bool TRUE)

if(my_bool) 
	message(STATUS "Condition2 was met")
else()
	message(STATUS "Condition2 failed")
endif()

# same as if(${my_bool})
# can do NOT my_bool
# string comparison 

set(MY_STRING "This is a string")
set(MY_OTHER_STRING "This is another string")

if(MY_STRING STREQUAL MY_OTHER_STRING) 
	message(STATUS "Condition3 was met")
else()
	message(STATUS "Condition3 failed")
endif()

# not the same as if(MY_STRING STREQUAL "MY_OTHER_STRING") 
# can do if(NOT MY_STRING STREQUAL MY_OTHER_STRING) 

set(my_value 1)

if((MY_STRING STREQUAL MY_OTHER_STRING) AND ("1" EQUAL my_value)) 
	message(STATUS "Condition4 was met")
elseif(MY_OTHER_STRING MATCHES "string$") #regular expression 
	message(STATUS "Variable ends with the word 'string'")
else()
	message(STATUS "Condition4 failed")
endif() # can do endif(MY_STRING) too but is unnecessary 


while(my_value LESS 5)
	message(STATUS "Value is ${my_value}")
	math(EXPR my_value "${my_value}+1")
endwhile()


foreach(item IN ITEMS foo bar baz qux)
	message(STATUS "Item is ${item}")
endforeach()


foreach(idx RANGE 10)
	message(STATUS "idx is ${idx}")
endforeach()


foreach(idx RANGE 6 9)
	message(STATUS "idx2 is ${idx}")
endforeach()


foreach(idx RANGE 60 90 5)
	message(STATUS "idx3 is ${idx}")
endforeach()


