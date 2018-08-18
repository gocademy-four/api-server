class TeachedlessonsController < ApplicationController
    def create
        params.require([:tutor_id, :lesson_name, :price_per_hour])
        
        teachedlesson = Teachedlesson.new
        teachedlesson.tutor = Tutor.find_by!(id: params[:tutor_id])
        if Lesson.exists?(name: params[:lesson_name])
            teachedlesson.lesson = Lesson.find_by!(name: params[:lesson_name])
        else
            teachedlesson.lesson = Lesson.create(name: params[:name])
        end
        teachedlesson.price_per_hour = params[:price_per_hour]
        teachedlesson.save!
        
        render json: {}
    end

    def show
        render json: {a: 2}
    end
end
