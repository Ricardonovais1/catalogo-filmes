class FilmsController < ApplicationController
    def show
        @film = Film.find(params[:id])
        @films = Film.all
    end

    def new
        @film = Film.new   
    end

    def create
        @film = Film.new(name:        params[:film][:name], 
                         year:        params[:film][:year],
                         category_id: params[:film][:category_id],
                         director_id: params[:film][:director_id],
                         synopsis:    params[:film][:synopsis],
                         duration:    params[:film][:duration])
        
        if @film.save
            flash[:notice] = 'Filme registrado com sucesso!'
            return redirect_to film_path(@film.id)
        end

        render :new
    end

    def edit 
        @film = Film.find(params[:id])
    end  

    def update 
        @film = Film.find(params[:id])

        if @film.update(name:        params[:film][:name], 
                        year:        params[:film][:year],
                        category_id: params[:film][:category_id],
                        director_id: params[:film][:director_id],
                        synopsis:    params[:film][:synopsis],
                        duration:    params[:film][:duration])
            return redirect_to film_path(@film.id)
        end

        render :edit
    end

    def destroy
        @film = Film.find(params[:id])
        @film.destroy
        # flash[:success] = 'Filme excluído com sucesso!'
        redirect_to root_path, notice: "Article was successfully deleted."
        
    end
end