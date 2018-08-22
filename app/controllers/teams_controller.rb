class TeamsController < ApplicationController

  def new
    @team = Team.new
    @users = User.all
  end

  def create
    @team = Team.create(team_params)
  end

  private

  def team_params
    params.require(:team).permit(:name, user_ids:[],
    users_attributes: [:name])
  end
end
