class AuthenticationMethodsController < ApplicationController

  def index
    rows = AuthenticationMethod.all
    respond_to do |format|
      format.json { render json: rows }
    end
  end

  def create
    Rails.logger.info("create authentication_method: " + params.to_s)
    row = AuthenticationMethod.new(methodname: params[:methodname], descr: params[:descr])
    row.save
    respond_to do |format|
      format.json { render json: row }
    end
  end

  def destroy
  end

  def update
  end

  
end
