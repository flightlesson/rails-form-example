class PermissionsController < ApplicationController
  def index
    Rails.logger.info("PermissionsController#index: " + params.to_s)
    begin
      q = Permission.select("id,permission,descr")
      rows = q.all
      respond_to do |format|
        format.json { render json: rows }
      end
    rescue => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.inspect)
      respond_to do |format|
        format.json {render json: {error: e}}
      end
    end
  end

  def create
    Rails.logger.info("Permission#create: " + params.to_s)
    row = Permission.new(permission: params[:permission], descr: params[:descr])
    begin
      row.save
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
    Rails.logger.info("PermissionsController#destroy: " + params.to_s)
    begin
      row = Permission.destroy(params[:id])
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
    Rails.logger.info("PermissionsController#update: " + params.to_s)
    begin
      row = Permission.update(params[:id], {permission: params[:permission], descr: params[:descr]})
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
