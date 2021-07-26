class ChatworkController < ApplicationController
    def index

    end
    def send_message
        if !params[:chatwork_api_token].empty?
            ChatWork.api_key =  params[:chatwork_api_token]
        else
            ChatWork.api_key = ENV['CHATWORK_API_TOKEN']  
        end
        message_send = params[:message_send]
        name = ChatWork::Me.get["name"]
        account_id = ChatWork::Me.get["account_id"]
        room_id = ChatWork::Me.get["room_id"]
        message_body = "[To:#{account_id}] #{name}\ #{message_send}"
        ChatWork::Message.create room_id: room_id, body: message_body

        #send message to Fb at rails-app FB
        fb_graph = Koala::Facebook::API.new(ENV['FB_ACCESS_TOKEN'])
        puts ENV['FB_ACCESS_TOKEN']
        # fb_page_access_token là access token của trang facebook (vô hạn hoặc giới hạn)
        post_content = message_body + 'get from ENV'
        fb_graph.put_wall_post(post_content, {link: "https://www.chatwork.com/#!rid100468"})
        #end send to FB

         redirect_to chatwork_url, notice: "Send to chatwork successful."
    rescue StandardError => e
        puts "caught exception #{e}! here !"
        redirect_to error_404_url, notice: "Chatwork api_token invalid."
    end
end
