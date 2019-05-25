class TeamsController < ApplicationController

  def show
  end

  def new
    @team = Team.new
    @team.users << current_user
    @users = @team.users.where.not(id: current_user.id)
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:name, :about, user_ids: [])
  end
end
