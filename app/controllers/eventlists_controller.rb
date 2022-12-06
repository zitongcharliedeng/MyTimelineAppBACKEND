class EventlistsController < ApplicationController
  def show_with_params
    @eventlist = Eventlist.find_by(id: params[:user][:id])
    @user = User.find_by(user_id: @eventlist.user_id)
    if (params[:user][:sessionToken] == @user.session_token)
      render json: {alert: "Obtained Timeline from the cloud :)", eventlistInJson: @eventlist.eventlist_in_json}
    else
      render json: {alert: "Unable to obtain timeline from the cloud right now :("}
    end
  end
  def update
    @eventlist = Eventlist.find_by(id: params[:user][:id])
    @user = User.find_by(id: @eventlist.user_id)
    if (params[:user][:sessionToken] == @user.session_token)
      @eventlist.eventlist_in_json = params[:eventlist][:eventlistInJson]
      (render json: {alert: "Eventlist changes saved in database"}) if @eventlist.save
    else
      render json: {alert: "Eventlist changes failed to save in database"}
    end
  end
end
