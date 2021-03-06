class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    render json: User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render 'users/user_with_token.json.jbuilder', user: @user
    else
      render json: {
        errors: @user.errors}, status: 500
    end
  end

  def show
    user_games = @user.games.map(&:id)
    render json: @user.attributes.merge({games: user_games})
  end

  def games
    @user = User.find(params[:user_id])
    user_games = @user.games
    render json: user_games
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def user_games
    User.last.games.map(&:id)
  end
end