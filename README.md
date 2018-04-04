# gRPC Client in Ruby

## steps

 1. Copy the proto file to client

 2. Generate the stubs
 grpc_tools_ruby_protoc -I  protos --ruby_out=lib --grpc_out=lib/protos/userdata.proto

 3. Run the client
 ruby users_client.rb 2 sathya@example.com
