class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Congratulations, you have now signed in with theAlife.!"
      redirect_to @user
    else
      render 'new'
    end
  end

end
