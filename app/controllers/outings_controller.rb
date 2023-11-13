class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:id])
  end

  def update  
    # require 'pry'; binding.pry
    @outing = Outing.find(params[:id])
    if params[:remove_contestant_name]
      @contestant = Contestant.find_by(name: params[:remove_contestant_name])
      @outing.contestants.delete(@contestant)
      redirect_to "/outings/#{@outing.id}"
    else
      flash[:alert] = "Something went wrong!"
      redirect_back(fallback_location: "/outings/#{@outing.id}")
    end
  end
end