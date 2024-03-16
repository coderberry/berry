# frozen_string_literal: true

module ImageCaption
  class Component < ApplicationViewComponent
    attr_reader :html

    def initialize(markdown:)
      @html = Commonmarker.to_html(markdown)
    end
  end
end
