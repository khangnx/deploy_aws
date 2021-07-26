class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    before_action :authorize
    protect_from_forgery with: :exception

    private
    def current_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
    helper_method :current_cart
    #this function for logger
    def append_info_to_payload(payload)
        super
       case 
          when payload[:status] == 200
            payload[:level] = "INFO"
          when payload[:status] == 302
            payload[:level] = "WARN"
          else
            payload[:level] = "ERROR"
          end
    end
    #this function for logger

    protected
    def authorize
        @user = User.find_by_id(session[:user_id])
        if @user == nil
            redirect_to '/login', :notice => "You must login"
        end
    end
end
