class FilmsController < ApplicationController
    def show
        @film = Film.find(params[:id])
    end

    def new
        @film = Film.new
    end

    def create 
        @film = Film.new(params.require(:film).permit(:title, :year, :synopsis, :country, :duration, :director_id, :category_id, :status, :image, :cast, :rating))
        if @film.save
            flash[:notice] = "Filme cadastrado com sucesso"
            return redirect_to new_film_path
        else 
            flash[:notice] = "Houve um problema!"
        end
        render :new
    end

    def edit 
        @film = Film.find(params[:id])
    end

    def update 
        @film = Film.find(params[:id])
        if @film.update(params.require(:film).permit(:title, :year, :synopsis, :country, :duration, :director_id, :category_id, :status, :image, :cast, :rating))
            flash[:notice] = "Filme atualizado com sucesso"
            return redirect_to film_path(@film.id)
        else 
            flas[:notice] = "Houve um problema!"
        end
        render :edit
    end

    def publish 
        film = Film.find(params[:id])
        film.publicado!
        redirect_to film_path(film.id)
    end

    def unpublish 
        film = Film.find(params[:id])
        film.rascunho!
        redirect_to film_path(film.id)
    end
end