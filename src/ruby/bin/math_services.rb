# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: math.proto for package 'math'
# Original file comments:
# Copyright 2015, Google Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

require 'grpc'
require 'math'

module Math
  module Math
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'math.Math'

      # Div divides args.dividend by args.divisor and returns the quotient and
      # remainder.
      rpc :Div, DivArgs, DivReply
      # DivMany accepts an arbitrary number of division args from the client stream
      # and sends back the results in the reply stream.  The stream continues until
      # the client closes its end; the server does the same after sending all the
      # replies.  The stream ends immediately if either end aborts.
      rpc :DivMany, stream(DivArgs), stream(DivReply)
      # Fib generates numbers in the Fibonacci sequence.  If args.limit > 0, Fib
      # generates up to limit numbers; otherwise it continues until the call is
      # canceled.  Unlike Fib above, Fib has no final FibReply.
      rpc :Fib, FibArgs, stream(Num)
      # Sum sums a stream of numbers, returning the final result once the stream
      # is closed.
      rpc :Sum, stream(Num), Num
    end

    Stub = Service.rpc_stub_class
  end
end