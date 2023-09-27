# frozen_string_literal: true

class UsersController < ApplicationController
  include UsersHelper
  # before_action :require_login, except: %i[new create]

  def index
    @users = User.all
  end

  def new
    @uses = User.new
  end

  def show
    @user = User.find(params[:id])
    @all_events = Event.where(creator_id: @user.id)
    @past_events = @all_events.where('date < ?', DateTime.now)
    @upcomming_events = @all_events.where('date > ?', DateTime.now)
  end
end
