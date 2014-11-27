class CategoriesController < ApplicationController
  before_action :check_admin, except: [:show]

  def new
    @region = find_region
    @category = Category.new
  end

  def create
    @region = find_region
    @category = Category.new(category_params)
    if @category.save
      redirect_to [@region, @category]
    else
      render :new
    end
  end

  def show
    @region = find_region
    @category = find_category
    @posts = @category.ordered_posts(@region).page(params[:page])
  end

  def edit
    @region = find_region
    @category = find_category
  end

  def update
    @region = find_region
    @category = find_category
    if @category.update(category_params)
      redirect_to [@region, @category]
    else
      render :edit
    end
  end

  def destroy
    @region = find_region
    @category = find_category
    @category.delete

    redirect_to @region
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def find_region
    Region.find(params[:region_id])
  end

  def find_category
    Category.find(params[:id])
  end
end
