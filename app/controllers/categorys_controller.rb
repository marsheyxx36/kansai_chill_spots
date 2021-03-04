class CategorysController < ApplicationController
    def show
    @prefecture = Area.find(params[:id])
    @category =  Post.where(prefecture_id: "#{params[:id]}")
    @category_children = Area.find("#{params[:id]}").children
    end

    def area_show
        @area = Area.find(params[:id])
        @category =  Post.where(area_id: "#{params[:id]}")
        @category_children = Area.find("#{params[:id]}").parent.children
        @prefecture = Area.find(params[:id]).parent
    end
end
