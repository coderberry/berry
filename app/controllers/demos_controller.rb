class DemosController < ApplicationController
  layout "demo_preview"

  before_action :load_demo

  # Displays the demo viewer
  # GET /demos/:name/:variant?controllers=...
  def show
  end

  def tabs
    render layout: false
  end

  # Renders the demo partial with a turbo frame
  # GET /demos/:name
  def preview
    @partial_path = "/demos/#{params[:name]}/#{params[:variant]}"
  end

  # Render the source code within a turbo frame
  # GET /demos/source_code?path=...
  def source_code
    binding.pry
    @relative_path = params[:path]
    @language = case File.extname(@relative_path)
                when ".bash", ".sh", ".shell" then :bash
                when ".erb" then :erb
                when ".htm", ".html" then :html
                when ".js", ".javascript" then :javascript
                when ".json" then :json
                when ".rb", ".ruby" then :ruby
                else :plaintext
                end

    render layout: false
  end

  private

  def load_demo
    @demo = Demo.new(
      name: params[:name],
      variant: params[:variant],
      paths: params.fetch(:paths, []),
      active_tab_id: params[:active_tab_id] # nil will default to preview
    )
  end
end
