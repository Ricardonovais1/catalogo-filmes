class DirectorsController < ApplicationController 
    def show
        @directors = Director.all
    end 

    def new 
        @director = Director.new
        @directors = Director.all

    end 

    def create 
        @director = Director.new(name:             params[:director][:name],
                                 country:          params[:director][:country],
                                 birth_year:       params[:director][:birth_year],
                                 category_id:      params[:director][:category_id])
        if @director.save 
            return redirect_to new_director_path
        end

        render :new
            
    end

end