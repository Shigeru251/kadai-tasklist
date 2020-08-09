class SessionsController < ApplicationController
  def new

  end

  def create
    userid = params[:session][:userid]
    password = params[:session][:password]
    if login(userid, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to tasks_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  private

  def login(userid, password)
    @user = User.find_by(userid: userid)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
