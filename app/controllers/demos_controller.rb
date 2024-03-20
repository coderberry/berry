class DemosController < ApplicationController
  layout "demo_preview"

  # Renders the demo partial (or source code)
  # GET /demos/:name
  def show
    @name = params[:name]
    @variant = params[:variant]
  end
end
