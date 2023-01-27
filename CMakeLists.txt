# CMakeList.txt : CMake project for PNTrianglesQuads, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project ("PNTrianglesQuads")

include_directories("common")


file(GLOB_RECURSE COMMON_SOURCES "common/*.cpp" "common/*.hpp")
file(GLOB SHADERS "shaders/*.glsl" "/*.glsl")

# Add source to this project's executable.
add_executable (${PROJECT_NAME} "PNTrianglesQuads.cpp" "PNTrianglesQuads.h" ${COMMON_SOURCES} ${SHADERS} )
file(COPY ${SHADERS} DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/shaders)

set(CMAKE_TOOLCHAIN_FILE "C:/src/vcpkg/scripts/buildsystems/vcpkg.cmake")
set(CMAKE_PREFIX_PATH "C:/src/vcpkg/installed/x64-windows/share")

if (CMAKE_VERSION VERSION_GREATER 3.12)
  set_property(TARGET PNTrianglesQuads PROPERTY CXX_STANDARD 20)
endif()

# TODO: Add tests and install targets if needed.
find_package(OpenGL REQUIRED) 
find_package(GLEW REQUIRED) 
find_package(glfw3 CONFIG REQUIRED) 
find_package(glm CONFIG REQUIRED)   
find_package(imgui CONFIG REQUIRED)

target_link_libraries(${PROJECT_NAME} PRIVATE OpenGL::GL GLEW::GLEW glfw glm::glm imgui::imgui)
