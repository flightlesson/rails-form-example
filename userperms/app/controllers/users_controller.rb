class UsersController < ApplicationController
  
  def index
    begin
      Rails.logger.info("UserController#index: " + params.to_s)
      rows = Array.new
      User.eager_load(:authentication_method).each do |r|
        rows.push({id: r[:id], username: r[:username], realname: r[:realname],
                   authentication_method_id: r[:authentication_method_id], authentication_method: r.authentication_method[:method]})
      end
      respond_to do |format|
        format.json { render json: rows }
      end
    rescue => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.to_s)
      respond_to do |format|
        format.json {render json: {error: e}}
      end
    end
  end

  def create
    begin
      Rails.logger.info("UserController#create: " + params.to_s)
      row = User.new(username: params[:username], realname: params[:realname], authentication_method_id: params[:authentication_method_id])
      row.save!
      Rails.logger.info("*** row is " + row.inspect)
      respond_to do |format|
        format.json { render json: row }
      end
    rescue ActiveRecord::NotNullViolation, ActiveRecord::RecordNotUnique => e
      respond_to do |format|
        format.json {render json: {error: e.class.to_s}}
      end
    rescue => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.inspect)
      respond_to do |format|
        format.json {render json: {error: e}}
      end
    end
  end

  def destroy
    Rails.logger.info("UsersController#destroy: " + params.to_s)
    begin
      row = User.destroy!(params[:id])
      Rails.logger.info("row: " + row.inspect)
      respond_to do |format|
        format.json {render json: row}
      end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json {render json: {error: e.class.to_s}}
      end
    rescue => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.inspect)
      respond_to do |format|
        format.json {render json: {error: e}}
      end
    end
  end

  def update
    Rails.logger.info("UsersController#update: " + params.to_s)
    begin
      row = User.update!(params[:id], {username: params[:username], realname: params[:realname], authentication_method_id: params[:authentication_method_id]})
      Rails.logger.info("row: " + row.inspect)
      respond_to do |format|
        format.json {render json: row}
      end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json {render json: {error: e.class.to_s}}
      end
    rescue => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.inspect)
      respond_to do |format|
        format.json {render json: {error: e}}
      end
    end
  end
end
