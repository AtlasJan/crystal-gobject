module Gio
  class OutputMessage
    include GObject::WrappedType

    def self.new(address : Gio::SocketAddress|Nil = nil, vectors : Gio::OutputVector|Nil = nil, num_vectors : UInt32|Nil = nil, bytes_sent : UInt32|Nil = nil, control_messages : Array(Gio::SocketControlMessage)|Nil = nil, num_control_messages : UInt32|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(40, 0u8)
      new(ptr.as(LibGio::OutputMessage*)).tap do |object|
        object.address = address unless address.nil?
        object.vectors = vectors unless vectors.nil?
        object.num_vectors = num_vectors unless num_vectors.nil?
        object.bytes_sent = bytes_sent unless bytes_sent.nil?
        object.control_messages = control_messages unless control_messages.nil?
        object.num_control_messages = num_control_messages unless num_control_messages.nil?
      end
    end

    @pointer : Void*
    def initialize(pointer : LibGio::OutputMessage*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGio::OutputMessage*)
    end

    def address
      Gio::SocketAddress.new((to_unsafe.as(LibGio::OutputMessage*).value.address))
    end

    def address=(value : Gio::SocketAddress)
      to_unsafe.as(LibGio::OutputMessage*).value.address = value.to_unsafe.as(LibGio::SocketAddress*)
    end

    def vectors
      Gio::OutputVector.new((to_unsafe.as(LibGio::OutputMessage*).value.vectors))
    end

    def vectors=(value : Gio::OutputVector)
      to_unsafe.as(LibGio::OutputMessage*).value.vectors = value.to_unsafe.as(LibGio::OutputVector*)
    end

    def num_vectors
      (to_unsafe.as(LibGio::OutputMessage*).value.num_vectors)
    end

    def num_vectors=(value : UInt32)
      to_unsafe.as(LibGio::OutputMessage*).value.num_vectors = UInt32.new(value)
    end

    def bytes_sent
      (to_unsafe.as(LibGio::OutputMessage*).value.bytes_sent)
    end

    def bytes_sent=(value : UInt32)
      to_unsafe.as(LibGio::OutputMessage*).value.bytes_sent = UInt32.new(value)
    end

    def control_messages
      PointerIterator.new((to_unsafe.as(LibGio::OutputMessage*).value.control_messages)) {|__item| Gio::SocketControlMessage.new(__item) }
    end

    def control_messages=(value : Array(Gio::SocketControlMessage))
      to_unsafe.as(LibGio::OutputMessage*).value.control_messages = value
    end

    def num_control_messages
      (to_unsafe.as(LibGio::OutputMessage*).value.num_control_messages)
    end

    def num_control_messages=(value : UInt32)
      to_unsafe.as(LibGio::OutputMessage*).value.num_control_messages = UInt32.new(value)
    end

  end
end

