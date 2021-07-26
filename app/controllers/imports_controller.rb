class ImportsController < ApplicationController
    def index
        @import = Order.new

    end
    def create
        @import = Order.import_file params[:file] #import,excel ,csv
        redirect_to root_path
    end
end
