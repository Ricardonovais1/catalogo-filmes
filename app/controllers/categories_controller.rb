class CategoriesController < ApplicationController
   def show
       @categories = Category.all
   end

   def new 
    @category = Category.new
   end

   def create
    @category = Category.new(name: params[:category][:name])

    if @category.save 
        flash[:notice] = 'Categoria registrada com sucesso!'
        return redirect_to category_path(@category.id)
    end

    render :show
   end
end