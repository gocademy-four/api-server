require 'token_service'

class TutorsController < ApplicationController
    def show
        if params[:id] then
            tutor = Tutor.find_by!(member_id: params[:id])
        else
            tutor = Tutor.find_by!(member_id: current_user.id)
        end

        render json: tutor.as_json.merge({
            member: tutor.member.as_json.except("password_digest"),
            regions: tutor.tutor_regions.as_json(except: [:tutor_id])
        })
    end

    def create
        tutor = Tutor.new
        tutor.member = Member.new(params.require(:member).permit(
            :email, :name, :phone_number, :gender, :street, :city, :password
        ))
        tutor.save!

        render json: {
            token: TokenService.issue(tutor.member.id)
        }
    end
end
