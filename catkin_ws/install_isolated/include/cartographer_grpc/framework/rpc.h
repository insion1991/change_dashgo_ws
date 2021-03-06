/*
 * Copyright 2017 The Cartographer Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef CARTOGRAPHER_GRPC_FRAMEWORK_RPC_H
#define CARTOGRAPHER_GRPC_FRAMEWORK_RPC_H

#include <memory>
#include <unordered_set>

#include "cartographer/common/mutex.h"
#include "cartographer_grpc/framework/execution_context.h"
#include "cartographer_grpc/framework/rpc_handler_interface.h"
#include "google/protobuf/message.h"
#include "grpc++/grpc++.h"
#include "grpc++/impl/codegen/async_stream.h"
#include "grpc++/impl/codegen/async_unary_call.h"
#include "grpc++/impl/codegen/proto_utils.h"
#include "grpc++/impl/codegen/service_type.h"

namespace cartographer_grpc {
namespace framework {

class Service;
class Rpc {
 public:
  enum class Event { NEW_CONNECTION = 0, READ, WRITE, DONE };
  struct RpcEvent {
    const Event event;
    Rpc* rpc;
    // Indicates whether the event is pending completion. E.g. 'event = READ'
    // and 'pending = true' means that a read has been requested but hasn't
    // completed yet. While 'pending = false' indicates, that the read has
    // completed and currently no read is in-flight.
    bool pending;
  };

  Rpc(int method_index, ::grpc::ServerCompletionQueue* server_completion_queue,
      ExecutionContext* execution_context,
      const RpcHandlerInfo& rpc_handler_info, Service* service);
  std::unique_ptr<Rpc> Clone();
  void OnRequest();
  void OnReadsDone();
  void RequestNextMethodInvocation();
  void RequestStreamingReadIfNeeded();
  void Write(std::unique_ptr<::google::protobuf::Message> message);
  Service* service() { return service_; }
  RpcEvent* GetRpcEvent(Event event);

 private:
  Rpc(const Rpc&) = delete;
  Rpc& operator=(const Rpc&) = delete;
  void InitializeReadersAndWriters(
      ::grpc::internal::RpcMethod::RpcType rpc_type);

  ::grpc::internal::AsyncReaderInterface<::google::protobuf::Message>*
  async_reader_interface();
  ::grpc::internal::ServerAsyncStreamingInterface* streaming_interface();

  int method_index_;
  ::grpc::ServerCompletionQueue* server_completion_queue_;
  ExecutionContext* execution_context_;
  RpcHandlerInfo rpc_handler_info_;
  Service* service_;
  ::grpc::ServerContext server_context_;

  RpcEvent new_connection_event_;
  RpcEvent read_event_;
  RpcEvent write_event_;
  RpcEvent done_event_;

  std::unique_ptr<google::protobuf::Message> request_;
  std::unique_ptr<google::protobuf::Message> response_;

  std::unique_ptr<RpcHandlerInterface> handler_;

  std::unique_ptr<::grpc::ServerAsyncReader<google::protobuf::Message,
                                            google::protobuf::Message>>
      server_async_reader_;
};

// This class keeps track of all in-flight RPCs for a 'Service'. Make sure that
// all RPCs have been terminated and removed from this object before it goes out
// of scope.
class ActiveRpcs {
 public:
  ActiveRpcs();
  ~ActiveRpcs() EXCLUDES(lock_);

  Rpc* Add(std::unique_ptr<Rpc> rpc) EXCLUDES(lock_);
  bool Remove(Rpc* rpc) EXCLUDES(lock_);

 private:
  cartographer::common::Mutex lock_;
  std::unordered_set<Rpc*> rpcs_;
};

}  // namespace framework
}  // namespace cartographer_grpc

#endif  // CARTOGRAPHER_GRPC_FRAMEWORK_RPC_H
