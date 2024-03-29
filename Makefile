# ----- protoc
PROTO_DIR := ./api/protos
PROTO_OUT_DIR := ./api
PROTO_PATH := /usr/local/include

GATEWAY_FLAGS := -I. -I/usr/local/include -I$(GOPATH)/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis -I/usr/local/include
DESCRIPTOR_OUT := ./envoy/api

# see https://github.com/protocolbuffers/protobuf/issues/1491
.PHONY: protoc
protoc:
	# ----- for python grpc server
	pipenv run python -m grpc_tools.protoc \
		-I=${PROTO_PATH} \
		-I=${PROTO_DIR} \
		${GATEWAY_FLAGS} \
		--python_out=${PROTO_OUT_DIR} \
		--grpc_python_out=${PROTO_OUT_DIR} \
		${PROTO_DIR}/*.proto
	sed -i.bak 's/^\(import.*_pb2\)/from . \1/' ${PROTO_OUT_DIR}/*pb2*.py 
	rm ${PROTO_OUT_DIR}/*.py.bak

	# ----- for envoy
	protoc $(GATEWAY_FLAGS) \
		-I=${PROTO_PATH} \
		--include_imports \
		--include_source_info \
  	--descriptor_set_out=${DESCRIPTOR_OUT}/proto.pb ${PROTO_DIR}/*.proto
