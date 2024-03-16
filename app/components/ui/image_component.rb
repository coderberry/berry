# frozen_string_literal: true

class UI::ImageComponent < ::BaseComponent
  attr_reader :path, :alt, :caption

  def initialize(path:, alt: nil, caption: nil)
    @path = path
    @alt = alt
    @caption = caption
  end
end
