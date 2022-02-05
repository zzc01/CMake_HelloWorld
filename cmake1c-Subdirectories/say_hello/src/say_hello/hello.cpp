#include "hello.h"
#include <iostream>


void hello::say_hello()
{
	std::cout << "Hello CMake! Version " << SAY_HELLO_VERSION << std::endl;
}
