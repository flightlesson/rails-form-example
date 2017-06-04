class AuthenticationMethodsController < ApplicationController

  def index
    Rails.logger.info("AuthenticationMethodsController#index: " + params.to_s)
    begin
      q = AuthenticationMethod.select("method,descr")
      rows = q.all
      respond_to do |format|
        format.json { render json: rows }
      end
    rescue Exception => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.inspect)
      respond_to do |format|
        format.json {render json: {error: e}}
      end
    end
  end

  def create
    Rails.logger.info("AuthenticationMethodsController#create: " + params.to_s)
    row = AuthenticationMethod.new(method: params[:method], descr: params[:descr])
    begin
      row.save
      respond_to do |format|
        format.json { render json: row }
      end
    rescue ActiveRecord::NotNullViolation, ActiveRecord::RecordNotUnique => e
      respond_to do |format|
        format.json {render json: {error: e.class.to_s}}
      end
    rescue Exception => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.inspect)
      respond_to do |format|
        format.json {render json: {error: e}}
      end
    end
  end

  def destroy
    Rails.logger.info("AuthenticationMethodsController#destroy: " + params.to_s)
    begin
      row = AuthenticationMethod.destroy(params[:id])
      Rails.logger.info("row: " + row.inspect)
      respond_to do |format|
        format.json {render json: row}
      end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json {render json: {error: e.class.to_s}}
      end
    rescue Exception => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.inspect)
      respond_to do |format|
        format.json {render json: {error: e}}
      end
    end
  end

  def update
    Rails.logger.info("AuthenticationMethodsController#update: " + params.to_s)
    begin
      row = AuthenticationMethod.update(params[:id], {method: params[:method], descr: params[:descr]})
      Rails.logger.info("row: " + row.inspect)
      respond_to do |format|
        format.json {render json: row}
      end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json {render json: {error: e.class.to_s}}
      end
    rescue Exception => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.inspect)
      respond_to do |format|
        format.json {render json: {error: e}}
      end
    end
  end
end
