# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "reperage: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ireperage:/home/florian/catkin_workspace/src/reperage/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Ireperage:/home/florian/catkin_workspace/src/reperage/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(reperage_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/florian/catkin_workspace/src/reperage/msg/Position.msg" NAME_WE)
add_custom_target(_reperage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "reperage" "/home/florian/catkin_workspace/src/reperage/msg/Position.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(reperage
  "/home/florian/catkin_workspace/src/reperage/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/reperage
)

### Generating Services

### Generating Module File
_generate_module_cpp(reperage
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/reperage
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(reperage_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(reperage_generate_messages reperage_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/reperage/msg/Position.msg" NAME_WE)
add_dependencies(reperage_generate_messages_cpp _reperage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(reperage_gencpp)
add_dependencies(reperage_gencpp reperage_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS reperage_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(reperage
  "/home/florian/catkin_workspace/src/reperage/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/reperage
)

### Generating Services

### Generating Module File
_generate_module_eus(reperage
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/reperage
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(reperage_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(reperage_generate_messages reperage_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/reperage/msg/Position.msg" NAME_WE)
add_dependencies(reperage_generate_messages_eus _reperage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(reperage_geneus)
add_dependencies(reperage_geneus reperage_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS reperage_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(reperage
  "/home/florian/catkin_workspace/src/reperage/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/reperage
)

### Generating Services

### Generating Module File
_generate_module_lisp(reperage
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/reperage
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(reperage_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(reperage_generate_messages reperage_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/reperage/msg/Position.msg" NAME_WE)
add_dependencies(reperage_generate_messages_lisp _reperage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(reperage_genlisp)
add_dependencies(reperage_genlisp reperage_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS reperage_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(reperage
  "/home/florian/catkin_workspace/src/reperage/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/reperage
)

### Generating Services

### Generating Module File
_generate_module_nodejs(reperage
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/reperage
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(reperage_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(reperage_generate_messages reperage_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/reperage/msg/Position.msg" NAME_WE)
add_dependencies(reperage_generate_messages_nodejs _reperage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(reperage_gennodejs)
add_dependencies(reperage_gennodejs reperage_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS reperage_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(reperage
  "/home/florian/catkin_workspace/src/reperage/msg/Position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/reperage
)

### Generating Services

### Generating Module File
_generate_module_py(reperage
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/reperage
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(reperage_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(reperage_generate_messages reperage_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/reperage/msg/Position.msg" NAME_WE)
add_dependencies(reperage_generate_messages_py _reperage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(reperage_genpy)
add_dependencies(reperage_genpy reperage_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS reperage_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/reperage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/reperage
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(reperage_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET reperage_generate_messages_cpp)
  add_dependencies(reperage_generate_messages_cpp reperage_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/reperage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/reperage
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(reperage_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET reperage_generate_messages_eus)
  add_dependencies(reperage_generate_messages_eus reperage_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/reperage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/reperage
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(reperage_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET reperage_generate_messages_lisp)
  add_dependencies(reperage_generate_messages_lisp reperage_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/reperage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/reperage
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(reperage_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET reperage_generate_messages_nodejs)
  add_dependencies(reperage_generate_messages_nodejs reperage_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/reperage)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/reperage\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/reperage
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(reperage_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET reperage_generate_messages_py)
  add_dependencies(reperage_generate_messages_py reperage_generate_messages_py)
endif()
