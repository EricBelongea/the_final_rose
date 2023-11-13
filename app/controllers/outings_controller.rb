class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:id])
  end

  def update  
    @outing = Outing.find(params[:id])
    if params[:remove_contestant_id]
      @contestant = Contestant.find(params[:remove_contestant_id])
      @outing.contestants.delete(@contestant)
      redirect_to "/outings/#{@outing.id}"
    else
      flash[:alert] = "Something went wrong!"
      redirect_back(fallback_location: "/outings/#{@outing.id}")
    end
  end
end