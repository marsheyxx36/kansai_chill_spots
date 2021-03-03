class CategorysController < ApplicationController
    def show
    @areas =  Area.find("#{params[:id]}").children
    
    @areas.each do  |area|
     @posts = []
     @post = Post.where(area_id: area.id)
     @posts << @post
    end
    binding.pry
    end
end
