class UsersController < ApplicationController
  def index
    users = User.all
    respond_to do |format|
      format.json { render json: rows }
    end
  end

  def create
    Rails.logger.info("create user: " + param.to_s);
    row = User.new(username: params[:username], realname: params[:realname], authentication_method: params[:authentication_method])
    row.save
    respond_to do |format|
      format.json { render json: row }
    end
  end
end
