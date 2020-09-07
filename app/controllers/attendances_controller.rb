class AttendancesController < ApplicationController
    before_action :find_event
    before_action :find_attendance, only: [:destroy]
    before_action :authenticate_user!

    def new
        if already_attendant?
            redirect_to event_path(params[:event_id]), alert: "Vous participez déjà à l'évènement"
        end
    end

    def create
        if already_attendant?
            redirect_to new_event_attendance(params[:event_id]), alert: "Vous participez déjà à l'évènement"
        else
            @event.attendances.create(user_id: current_user.id)
        end
    end

    def destroy
        if !(already_attendant?)
            flash[:alert] = "Vous participez déjà à l'évènement"
        else
            Attendance.destroy(params[:id])
            redirect_to event_path(params[:event_id]), notice: "Vous vous êtes désincrit de l'évènement"
        end
    end

    private

    def find_event
        @event = Event.find(params[:event_id])
    end

    def find_attendance
        @attendance = @event.attendances.where(user_id: current_user.id)
    end

    def already_attendant?
        Attendance.where(user_id: current_user.id, event_id:params[:event_id]).exists?
    end
end
