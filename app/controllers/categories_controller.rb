class CategoriesController < ApplicationController
  def index
    @parent_categories = Category.where(ancestry: nil).order("id ASC")
  end
end
