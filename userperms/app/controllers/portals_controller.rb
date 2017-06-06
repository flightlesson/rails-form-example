class PortalsController < ApplicationController
  def index

    Rails.logger.info("PortalsController#index: page is " + (params[:page] || 'index'))
    
    respond_to do |format|
      format.html { render template: "portals/#{(params[:page] || 'index')}.html" }
    end
  end
end
