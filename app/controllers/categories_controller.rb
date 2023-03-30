class CategoriesController < ApplicationController
    def index 
        @categories = Category.all
    end

    def show 
        @category = Category.find(params[:id])
        @films = Film.all
    end

    def new
        @category = Category.new
    end

    def create 
        @category = Category.new(params.require(:category).permit(:name))
        if @category.save
            flash[:notice] = "Categoria cadastrada com sucesso"
            return redirect_to new_category_path
        else 
            flash[:notice] = "Houve um problema!"
        end
        render :new
    end

    
end