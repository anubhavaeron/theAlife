class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Congratulations, you have now signed in with theAlife!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  #def signed_in_user
   # redirect_to signin_url, notice: "Please sign in." unless signed_in?
  #end



end
