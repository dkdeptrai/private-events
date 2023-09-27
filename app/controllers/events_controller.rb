# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end
  

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @creator = @event.build_creator(id: current_user.id)
    if @event.save
      flash[:success] = "#{@event.name} successfully created"
      redirect_to @event
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end
  
end
