class DemoSourcesController < ApplicationController
  # Renders the source code for the filepath
  # GET /demo_sources?path=app/assets/javascripts/components/demo_component.js
  def show
    @path = params[:path]
  end
end
