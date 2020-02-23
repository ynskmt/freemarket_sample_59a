class CategoriesController < ApplicationController
  def index
    @parent_categories = Category.where(ancestry: nil).order("id ASC")
  end

  def show
    @show_category = Category.find(params[:id])
    if @show_category.has_children?
      @category_products = Product.where(category_id: @show_category.descendant_ids).order("id DESC").limit(100)
    else
      @category_products = Product.where(category_id: @show_category.id).order("id DESC").limit(100)
    end
  end
end
