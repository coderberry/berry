# frozen_string_literal: true

module Demo
  class Component < ApplicationViewComponent
    attr_reader :title, :name, :variant, :stimulus_controllers, :demo_path

    def initialize(name:, variant:, title: nil, stimulus_controllers: [], **)
      super

      @title = title
      @name = name
      @variant = variant
      @stimulus_controllers = stimulus_controllers
    end

    def tabs
      preview_path = "/demos/#{name}/#{variant}"
      erb_partial_path = "/demos/#{name}/_#{variant}.html.erb"
      erb_path = "/demo_source?path=#{erb_partial_path}"

      # Add the default tabs
      tab_data = [
        { tab_id: "tab-demo", label: "preview", classes: "rounded-tl-md", active: true, src: preview_path },
        { tab_id: "tab-erb", label: "example.html.erb", src: erb_path }
      ]

      # Add a tab for each stimulus controller
      stimulus_controllers.each_with_index do |controller_path, index|
        filename = controller_path.split("/").last
        tab_data << { tab_id: "controller_#{index + 1}", label: filename, src: "/demo_sources?path=#{controller_path}" }
      end

      tab_data
    end

    def show_title?
      @title.present?
    end
  end
end
