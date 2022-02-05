# go to build/
# enter cmake .. 
# enter cmake --build . 

# every line is a command 
cmake_minimum_required(VERSION 3.22.2)

# project call 
# everything is string 
project(MyProject VERSION 1.1.2)

# can print out messages 
# the " "  helps to put the spaces together 
message(STATUS "I am a message")

#variables
set(MY_VARIABLE "a variable")
message(STATUS "The message is: ${MY_VARIABLE}")

# some cammand also sets variable 
message(STATUS "The message is: ${PROJECT_VERSION}")
# the project call command also sets variable 
message(STATUS "The message is: ${PROJECT_NAME}")
