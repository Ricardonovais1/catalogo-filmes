class FilmsController < ApplicationController
    def show
        @film = Film.find(params[:id])
        @films = Film.all
    end

    def new
        @film = Film.new   
    end

    def create

        if params[:film][:image]
            img = params[:film][:image].read  
            encoded_img = Base64.encode64(img)
        else
            encoded_img = nil
        end

        @film = Film.new(name:        params[:film][:name], 
                         year:        params[:film][:year],
                         category_id: params[:film][:category_id],
                         director_id: params[:film][:director_id],
                         synopsis:    params[:film][:synopsis],
                         duration:    params[:film][:duration],
                         image:       encoded_img 
        )
        

            if @film.save
                flash[:notice] = 'Filme registrado com sucesso!'
                return redirect_to film_path(@film.id)
            end
        render :new
    end

    # def create
    #     if params[:film][:image]
    #       img = params[:film][:image].read  
    #       File.open("public/uploads/#{params[:film][:image].original_filename}", 'wb') do |f|
    #           f.write(img)
    #       end
    #       @film = Film.new(name:        params[:film][:name], 
    #                        year:        params[:film][:year],
    #                        category_id: params[:film][:category_id],
    #                        director_id: params[:film][:director_id],
    #                        synopsis:    params[:film][:synopsis],
    #                        duration:    params[:film][:duration],
    #                        image:       params[:film][:image].original_filename
    #       )
    #     else
    #       @film = Film.new(name:        params[:film][:name], 
    #                        year:        params[:film][:year],
    #                        category_id: params[:film][:category_id],
    #                        director_id: params[:film][:director_id],
    #                        synopsis:    params[:film][:synopsis],
    #                        duration:    params[:film][:duration],
    #       )
    #     end
      
    #     if @film.save
    #       flash[:notice] = 'Filme registrado com sucesso!'
    #       return redirect_to film_path(@film.id)
    #     end
      
    #     render :new
    #   end

    def edit 
        @film = Film.find(params[:id])
    end  

    def update 
        @film = Film.find(params[:id])

        if params[:film][:image]
            img = params[:film][:image].read  
            encoded_img = Base64.encode64(img)
            if @film.update(name:        params[:film][:name], 
                            year:        params[:film][:year],
                            category_id: params[:film][:category_id],
                            director_id: params[:film][:director_id],
                            synopsis:    params[:film][:synopsis],
                            duration:    params[:film][:duration],
                            image:       encoded_img 
                        )
                return redirect_to film_path(@film.id)
            end
        else
            if @film.update(name:        params[:film][:name], 
                            year:        params[:film][:year],
                            category_id: params[:film][:category_id],
                            director_id: params[:film][:director_id],
                            synopsis:    params[:film][:synopsis],
                            duration:    params[:film][:duration],
                        )
                return redirect_to film_path(@film.id)
            end      
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
