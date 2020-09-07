class ChargesController < ApplicationController
    
    def new
      @even = Event.find(params[:id])
    end
    
    def create
      # Amount in cents
      @amount = 500
      @even = Event.find(params[:id])
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })

      x = Attendance.create(stripe_customer_id: customer.id, event_id: @even, user_id: current_user)

      if x !== Nil 
        flash[:success] = "Paiement réussi ! Tu es maintenant inscrit à cet evenement"
        redirect_to events_path
      else
        flash[:error] = "Le paiement a échoué ! "
        redirect_to new_charge_path
      end 

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
