class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    # Vì từ 1 lấy qua bảng nhiều nên phải là category_attachments
    @categories = Category.includes(:category_attachments)
  end

  # GET /categories/1 or /categories/1.json
  def show
  
  end

  # GET /categories/new
  def new
    @category = Category.new
    @category_attachments = @category.category_attachments.build
  end

  # GET /categories/1/edit
  def edit
    @category_attachments = @category.category_attachments.build
    @from_edit = params[:id]
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    if @category.save
      params[:category_attachments]['attachment'].each do |a|
         @category_attachments = @category.category_attachments.create!(attachment: a)
      end
     redirect_to @category
    else
       render :new
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.fetch(:category, {}).permit(:title, category_attachments_attributes: [:id, :category_id, :attachment])
  end
end
