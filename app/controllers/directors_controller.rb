class DirectorsController < ApplicationController
    def index 
        @directors = Director.all
    end 

    def new
        @director = Director.new
    end

    def create 
        @director = Director.new(params.require(:director).permit(:name, :nationality, :birth_year, :category_id))
        if @director.save
            flash[:notice] = "Diretor cadastrado com sucesso"
            return redirect_to director_path(@director.id)
        else 
            flash[:notice] = "Houve um problema!"
        end
        render :new
    end

    def show
        @director = Director.find(params[:id]) 
        @films = Film.all
    end

    def edit 
        @director = Director.find(params[:id]) 
    end

    def update 
        @director = Director.find(params[:id]) 
        if @director.update(params.require(:director).permit(:name, :nationality, :birth_year, :category_id))
            flash[:notice] = "Diretor atualizado com sucesso"
            return redirect_to director_path(@director.id)
        else 
            flash[:notice] = "Houve um problema!"
        end
        render :edit
    end
end