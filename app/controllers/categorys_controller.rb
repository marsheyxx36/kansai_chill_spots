class CategorysController < ApplicationController
  def show
    @prefecture = Area.find(params[:id])
    @category = Post.where(prefecture_id: params[:id].to_s)
    @category_children = Area.find(params[:id].to_s).children
  end

  def area_show
    @area = Area.find(params[:id])
    @category = Post.where(area_id: params[:id].to_s)
    @category_children = Area.find(params[:id].to_s).parent.children
    @prefecture = Area.find(params[:id]).parent
  end
end
