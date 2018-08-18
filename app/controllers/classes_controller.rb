class ClassesController < ApplicationController
    def show

        data = Teachedlesson.all
        
        if params[:category_id]
            lesson_ids = Lesson.where(category_id: params[:category_id]).ids
            data = data.where(lesson_id: lesson_ids)
        end

        if params[:lesson_id]
            data = data.where(lesson_id: params[:lesson_id])
        end

        render json: data
    end
end
