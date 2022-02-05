#include <iostream>
//#include "C:\Dev\CmakeTest\AddingSubdirectories\say_hello\src\say_hello\hello.h"
#include <hello.h>

int main()
{

	#ifndef NDEBUG
	std::wcout << L"This is a debug build \n";
	#endif


	//std::cout << "Hello CMake!" << std::endl;
	hello::say_hello(); 
	
	std::cout << "The say-hello library is version " << SAY_HELLO_VERSION << std::endl; 
}