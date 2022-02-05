#include <iostream>
#include "hello.h"

int main()
{

	#ifndef NDEBUG
	std::wcout << L"This is a debug build \n";
	#endif


	//std::cout << "Hello CMake!" << std::endl;
	hello::say_hello(); 
}