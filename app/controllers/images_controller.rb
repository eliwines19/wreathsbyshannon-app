class ImagesController < ApplicationController

    skip_before_action :authorized, only: [:index]
    
    def index
        @images = Image.all.reverse
    end

    def new
        @image = Image.new
    end

    def create 
        @image = Image.create(image_params)
        redirect_to '/admin'
    end


    private

    def image_params
        params.require(:image).permit(:image)
    end
end
