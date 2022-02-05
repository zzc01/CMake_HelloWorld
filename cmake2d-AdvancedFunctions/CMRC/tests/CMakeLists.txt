# in build/
# cmake .. 
# cmake --build . 
# main.exe
# ctest 


# demonstrating test a code 

############################################################ 
#normal add_library(target sources)
#cmrc_add_resource_library(simple ALIAS rc::simple hello.txt)

#add_executable(simple-test simple.cpp)
#if don't include this line. will get a error cannot find cmrc/cmrc.hpp
# but linking rc::simple has nothing to do with cmrc/cmrc.hpp 
# perhaps in the cmrc_add_resource_library() function adds cmrc/cmrc.hpp path 
#target_link_libraries(simple-test PRIVATE rc::simple)

# create a test called simple using simple-test.exe
#add_test(simple simple-test)

#set_property(
	# here put the test name which is simple 
#	TEST simple 
#	PROPERTY PASS_REGULAR_EXPRESSION
#	"^Hello, world!" 
#	) 
	
# set property on a TEST of name simple 
# the property set is PASS_REGULAR_EXPRESSION with value "^Hello, wor1ld!"
	
############################################################ 
#cmrc_add_resource_library(whence
#	ALIAS rc::whence 
#	WHENCE subdir_a
#	subdir_a/subdir_b/file_a.txt
#	)

#add_executable(whence-test whence.cpp)	
#target_link_libraries(whence-test PRIVATE rc::whence)
#add_test(whence whence-test)
#set_property(
	# here put the test name which is whence 
#	TEST whence 
#	PROPERTY PASS_REGULAR_EXPRESSION
#	"^I am a file!"
#	)

# set property on a TEST of name whence 
# the property set is PASS_REGULAR_EXPRESSION with value "^I am not a file!"
	
############################################################ 
#function(cmrc_add_test test_name main_source resource_file pass_regex whence_arg)
function(cmrc_add_test)
	set(options WILL_FAIL)
	#set(args NAME SOURCE RESOURCE PASS_REGX WHENCE PREFIX)
	set(args NAME SOURCE PASS_REGX WHENCE PREFIX)
	#set(list_args TEST_ARGV)
	set(list_args RESOURCES TEST_ARGV)
	cmake_parse_arguments(
		PARSE_ARGV 0 
		test 	# adds this prefix in the fron of the arg 
		"${options}"
		"${args}"
		"${list_args}"
	)
	
	message(STATUS "Called cmrc_add_test() for test: ${test_NAME}")
	message(STATUS "Source file is '${test_SOURCE}'")
	message(STATUS "Resource files are '${test_RESOURCES}'")
	message(STATUS "PASS_REGX is '${test_PASS_REGX}'")
	message(STATUS "WHENCE is '${test_WHENCE}'")
	message(STATUS "PREFIX is '${test_PREFIX}'")
	message(STATUS "Will fail '${test_WILL_FAIL}'")
	
	foreach(arg IN LISTS test_UNPARSED_ARGUMENTS)
		#message(STATUS "Unparsed argument: ${arg}")
		# can use this to warn user about unintentional passing arg
		message(WARNING "Unparsed argument: ${arg}") 
	endforeach()
	
	cmrc_add_resource_library(
		rc_${test_NAME}
		NAMESPACE ${test_NAME}
		${test_RESOURCES}
		WHENCE "${test_WHENCE}"
		PREFIX "${test_PREFIX}"
		)
	#cmrc_add_resource_library(
	#	rc_${test_name}
	#	NAMESPACE ${test_name}
	#	${resource_file}
	#	WHENCE "${whence_arg}"
	#)
	add_executable("${test_NAME}" "${test_SOURCE}")
	#add_executable("${test_name}" "${main_source}")
	target_link_libraries("${test_NAME}" PRIVATE rc_${test_NAME})
	#target_link_libraries("${test_name}" PRIVATE rc_${test_name})
	#add_test("${test_NAME}" "${test_NAME}")
	add_test("${test_NAME}" "${test_NAME}" ${test_TEST_ARGV})
	#add_test("${test_name}" "${test_name}")
	
	if(DEFINED test_PASS_REGX)
		set_property(
			TEST "${test_NAME}"
			PROPERTY PASS_REGULAR_EXPRESSION
			"${test_PASS_REGX}"
			)
	endif()

	set_property(
		TEST "${test_NAME}"
		PROPERTY WILL_FAIL
		"${test_WILL_FAIL}"
		)

	#set_property(
	#	TEST "${test_name}"
	#	PROPERTY PASS_REGULAR_EXPRESSION
	#	"${pass_regex}"
	#	)
endfunction()

cmrc_add_test(
	NAME simple 
	SOURCE simple.cpp
	RESOURCES hello.txt
	PASS_REGX "^Hello, world!"
	#""   # don't need this any more 
	)

cmrc_add_test(
	NAME whence 
	SOURCE whence.cpp
	RESOURCES subdir_a/subdir_b/file_a.txt
	PASS_REGX "^I am a file!"
	WHENCE subdir_a
)

cmrc_add_test(
	NAME prefix
	SOURCE prefix.cpp
	RESOURCES hello.txt
	PASS_REGX "^Hello, world!"
	PREFIX some-prefix
)

cmrc_add_test(
	NAME whence_prefix
	SOURCE whence_prefix.cpp
	RESOURCES subdir_a/subdir_b/file_b.txt
	PASS_REGX "^I am a file!"
	WHENCE subdir_a
	PREFIX imaginary-prefix
)

cmrc_add_test(
	NAME flower
	SOURCE flower.cpp
	RESOURCES flower.jpg
	TEST_ARGV "${CMAKE_CURRENT_SOURCE_DIR}/flower.jpg"
)

cmrc_add_test(
	NAME iterate
	SOURCE iterate.cpp
	RESOURCES 
		subdir_a/subdir_b/file_a.txt
		subdir_a/subdir_b/file_b.txt
	#PASS_REGX "^file_a.txt\nfile_b.txt\n$"
	#PASS_REGEX "^subdir_a\nfile_a.txt\nfile_b.txt\n$"
)

cmrc_add_test(
	NAME enoent
	SOURCE enoent.cpp
	WILL_FAIL
	)


