class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! name: data["name"], message: data["message"]
    ActionCable.server.broadcast "chat_room_channel", {message: data["message"], sent_by: data["name"]}
  end

  def announce(data)
    ActionCable.server.broadcast "chat_room_channel", {chat_room_name: data["name"], type: data["type"]}
  end
end