class RolesController < ApplicationController
  def index
    Rails.logger.info("RolesController#index: " + params.to_s)
    begin
      q = Role.select("id,role,descr")
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
    Rails.logger.info("Role#create: " + params.to_s)
    row = Role.new(role: params[:role], descr: params[:descr])
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
    Rails.logger.info("RolesController#destroy: " + params.to_s)
    begin
      row = Role.destroy(params[:id])
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
    Rails.logger.info("RolesController#update: " + params.to_s)
    begin
      row = Role.update(params[:id], {role: params[:role], descr: params[:descr]})
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
