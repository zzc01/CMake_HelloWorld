cmake_minimum_required(VERSION 3.22.2)
project(TopProject VERSION 2.4.1)

include(PrintVariables.cmake)
#print_variables()

# need to add say_hello before hello_ext
# because in hello_exe it depends on say_hello 
# hello-exe by default generated as binary dir. example-binary-subdir will override it. 
#add_subdirectory(hello-exe example-binary-subdir)
# when inter this subdirectory PROJECT_SOURCE_DIR will change until return back to this scope 
add_subdirectory(hello-exe)
add_subdirectory(say-hello)

message("add_subdirectory() returned")

print_variables()

