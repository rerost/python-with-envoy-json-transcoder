# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
import grpc

from google.protobuf import empty_pb2 as google_dot_protobuf_dot_empty__pb2
from . import recommend_pb2 as recommend__pb2


class RecommendServiceStub(object):
  # missing associated documentation comment in .proto file
  pass

  def __init__(self, channel):
    """Constructor.

    Args:
      channel: A grpc.Channel.
    """
    self.ListUsers = channel.unary_unary(
        '/python_with_grpc_gateway.RecommendService/ListUsers',
        request_serializer=google_dot_protobuf_dot_empty__pb2.Empty.SerializeToString,
        response_deserializer=recommend__pb2.ListUsersResponse.FromString,
        )


class RecommendServiceServicer(object):
  # missing associated documentation comment in .proto file
  pass

  def ListUsers(self, request, context):
    # missing associated documentation comment in .proto file
    pass
    context.set_code(grpc.StatusCode.UNIMPLEMENTED)
    context.set_details('Method not implemented!')
    raise NotImplementedError('Method not implemented!')


def add_RecommendServiceServicer_to_server(servicer, server):
  rpc_method_handlers = {
      'ListUsers': grpc.unary_unary_rpc_method_handler(
          servicer.ListUsers,
          request_deserializer=google_dot_protobuf_dot_empty__pb2.Empty.FromString,
          response_serializer=recommend__pb2.ListUsersResponse.SerializeToString,
      ),
  }
  generic_handler = grpc.method_handlers_generic_handler(
      'python_with_grpc_gateway.RecommendService', rpc_method_handlers)
  server.add_generic_rpc_handlers((generic_handler,))
