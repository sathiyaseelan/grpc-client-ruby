#!/usr/bin/env ruby

# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Sample app that connects to a Greeter service.
#
# Usage: $ path/to/greeter_client.rb

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'userdata_services_pb'

def main

  user = nil
  
  # Connect to gRPC server
  stub = Userdata::V1::UserData::Stub.new('localhost:9003', :this_channel_is_insecure)

  case ARGV[0].to_i
  when 1
  
    # Construct Request
    request = Userdata::V1::CreateUserRequest.new(first_name: 'sathya', last_name: 'm', email:  ARGV[1])
  
    # Call Remote Method
    user = stub.create_user(request)  
    
  when 2
    
    request = Userdata::V1::GetUserRequest.new(email: ARGV[1])

    user = stub.get_user(request)
  
  when 3
    request = Userdata::V1::DeleteUserRequest.new(id: ARGV[1].to_i)

    status = stub.delete_user(request)
    puts status
  else
    puts "Invalid choice"
  end

  p user
end

main