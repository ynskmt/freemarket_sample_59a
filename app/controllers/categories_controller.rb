class CategoriesController < ApplicationController
  def index
    @parent_categories = Category.where(ancestry: nil).order("id ASC")
  end

  def show
    @ladies = Product.where(category_id:1..199).order("created_at DESC").limit(10)
  end
end
