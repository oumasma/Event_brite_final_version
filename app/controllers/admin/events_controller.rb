class Admin::EventsController < ApplicationController
    before_action :check_if_admin #quand on parle d'admin on parle du SUPERADMIN

    def index
        @total_price_events = 0
        Attendance.all.each do |att|
            @total_price_events += att.event.price
        end

        @events_pending = Event.all.where(validated: false)
        @events_pending = [] if @events_pending.nil?
    end

    def update
        Event.find(params[:id]).update(validated: true)
        redirect_to admin_events_path, notice: "L'évènement #{Event.find(params[:id]).title} a été validé"
    end
    
    def cancel_return
        Event.find(params[:id]).update(validated: false)
        redirect_to admin_events_path, alert: "L'évènement #{Event.find(params[:id]).title} a été refusé"
    end

    def destroy
        Event.find(params[:id]).destroy
        redirect_to admin_events_path, alert: "L'évènement a été supprimé"

    end

    

    private

    def check_if_admin
        unless current_user.is_admin
            flash[:alert] = "Vous ne pouvez pas accéder à cette page, car vous n'êtes pas admin"
            redirect_to events_path
        end
    end

end
