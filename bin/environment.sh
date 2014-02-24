#!/usr/bin/env bash

test ! "${MESOS_BUILD_DIR}" && \
  echo "You must specify the MESOS_BUILD_DIR environment variable" && \
  return 1

_DISTRIBUTE_EGG=${MESOS_BUILD_DIR}/3rdparty/distribute-0.6.26/dist/
_DISTRIBUTE_EGG+=distribute-0.6.26-py2.6.egg
export DISTRIBUTE_EGG=${_DISTRIBUTE_EGG}

test ! -e ${DISTRIBUTE_EGG} && \
  echo "Failed to find ${DISTRIBUTE_EGG}" && \
  return 1

export PROTOBUF=${MESOS_BUILD_DIR}/3rdparty/libprocess/3rdparty/protobuf-2.5.0

_PROTOBUF_EGG=${PROTOBUF}/python/dist/
_PROTOBUF_EGG+=protobuf-2.5.0-py2.6.egg
export PROTOBUF_EGG=${_PROTOBUF_EGG}

test ! -f "${PROTOBUF_EGG}" && \
  echo "Failed to find ${PROTOBUF_EGG}" && \
  return 1

_MESOS_EGG=${MESOS_BUILD_DIR}/src/python/dist/
_MESOS_EGG+=mesos-0.19.0*.egg
export MESOS_EGG=`ls ${_MESOS_EGG} | head -n1`

test ! -f "${MESOS_EGG}" && \
  echo "Failed to find ${MESOS_EGG}" && \
  return 1

# Because `test` exits with a non-zero exit code it causes this script
# to exit non-zero. LIES.
return 0
