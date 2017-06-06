class PortalsController < ApplicationController
  def index

    Rails.logger.info("PortalsController#index: page is " + (params[:page] || 'index'))
    begin
      respond_to do |format|
        format.html { render template: "portals/#{(params[:page] || 'index')}.html" }
      end
    rescue ActionView::MissingTemplate => e
      redirect_to :root
    rescue => e
      Rails.logger.info("rescue: " + e.class.to_s + ": " + e.inspect)
    end
  end
end
