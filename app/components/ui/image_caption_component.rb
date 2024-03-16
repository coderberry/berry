# frozen_string_literal: true

class UI::ImageCaptionComponent < ::BaseComponent
  attr_reader :html

  def initialize(markdown:)
    @html = Commonmarker.to_html(markdown)
  end
end
