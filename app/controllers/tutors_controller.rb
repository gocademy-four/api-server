class TutorsController < ApplicationController
    def show
        tutor = Tutor.find_by!({id: params[:id]})

        render json: tutor.as_json.merge({
            member: tutor.member.as_json.except("password_digest"),
            regions: tutor.tutor_regions.as_json(except: [:tutor_id])
        })
    end
end
