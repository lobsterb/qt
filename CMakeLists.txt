# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

# Enable Hot Reload for MSVC compilers if supported.
if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

# 设置项目名称
project ("qt")

set (CMAKE_C_STANDARD 99)
# 启用C++17支持
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 设置输出路径
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin) 

# 确保 CMAKE_PREFIX_PATH 包含了 Qt6 的路径, 将环境变量中的CMAKE_PREFIX_PATH值添加到CMake中CMAKE_PREFIX_PATH的最后
list(APPEND CMAKE_PREFIX_PATH $ENV{CMAKE_PREFIX_PATH}) 
# 遍历 CMAKE_PREFIX_PATH 并输出每个条目
foreach(path IN LISTS CMAKE_PREFIX_PATH)
    message(STATUS "CMAKE_PREFIX_PATH entry: ${path}")
endforeach()
# 设置 CMAKE_PREFIX_PATH 的值，指向 Qt6 安装路径。(环境变量)

# 使用 find_package 指令来查找 Qt6 的配置文件
find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)


# Include sub-projects.
add_subdirectory ("qml_book")
