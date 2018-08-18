class TeachedlessonsController < ApplicationController
    def create
        params.require([:lesson_name, :price_per_hour])
        
        teachedlesson = Teachedlesson.new
        teachedlesson.tutor = Tutor.find_by!(member_id: current_user.id)
        if Lesson.exists?(name: params[:lesson_name])
            teachedlesson.lesson = Lesson.find_by!(name: params[:lesson_name])
        else
            Category.create(name: "dummy") unless Category.exists?(id: 1)
            lesson = Lesson.new(name: params[:name], category_id: 1)
            lesson.save!
            teachedlesson.lesson = lesson
        end
        teachedlesson.price_per_hour = params[:price_per_hour]
        teachedlesson.save!

        render json: {}
    end
end
