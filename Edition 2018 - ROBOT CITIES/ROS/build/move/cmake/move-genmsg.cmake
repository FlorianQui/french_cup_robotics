# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "move: 1 messages, 0 services")

set(MSG_I_FLAGS "-Imove:/home/florian/catkin_workspace/src/move/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Imove:/home/florian/catkin_workspace/src/move/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(move_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/florian/catkin_workspace/src/move/msg/Move.msg" NAME_WE)
add_custom_target(_move_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "move" "/home/florian/catkin_workspace/src/move/msg/Move.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(move
  "/home/florian/catkin_workspace/src/move/msg/Move.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/move
)

### Generating Services

### Generating Module File
_generate_module_cpp(move
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/move
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(move_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(move_generate_messages move_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/move/msg/Move.msg" NAME_WE)
add_dependencies(move_generate_messages_cpp _move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_gencpp)
add_dependencies(move_gencpp move_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(move
  "/home/florian/catkin_workspace/src/move/msg/Move.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/move
)

### Generating Services

### Generating Module File
_generate_module_eus(move
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/move
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(move_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(move_generate_messages move_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/move/msg/Move.msg" NAME_WE)
add_dependencies(move_generate_messages_eus _move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_geneus)
add_dependencies(move_geneus move_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(move
  "/home/florian/catkin_workspace/src/move/msg/Move.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/move
)

### Generating Services

### Generating Module File
_generate_module_lisp(move
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/move
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(move_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(move_generate_messages move_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/move/msg/Move.msg" NAME_WE)
add_dependencies(move_generate_messages_lisp _move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_genlisp)
add_dependencies(move_genlisp move_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(move
  "/home/florian/catkin_workspace/src/move/msg/Move.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/move
)

### Generating Services

### Generating Module File
_generate_module_nodejs(move
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/move
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(move_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(move_generate_messages move_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/move/msg/Move.msg" NAME_WE)
add_dependencies(move_generate_messages_nodejs _move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_gennodejs)
add_dependencies(move_gennodejs move_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(move
  "/home/florian/catkin_workspace/src/move/msg/Move.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move
)

### Generating Services

### Generating Module File
_generate_module_py(move
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(move_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(move_generate_messages move_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/florian/catkin_workspace/src/move/msg/Move.msg" NAME_WE)
add_dependencies(move_generate_messages_py _move_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_genpy)
add_dependencies(move_genpy move_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/move)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/move
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(move_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET move_generate_messages_cpp)
  add_dependencies(move_generate_messages_cpp move_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/move)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/move
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(move_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET move_generate_messages_eus)
  add_dependencies(move_generate_messages_eus move_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/move)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/move
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(move_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET move_generate_messages_lisp)
  add_dependencies(move_generate_messages_lisp move_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/move)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/move
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(move_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET move_generate_messages_nodejs)
  add_dependencies(move_generate_messages_nodejs move_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(move_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET move_generate_messages_py)
  add_dependencies(move_generate_messages_py move_generate_messages_py)
endif()
