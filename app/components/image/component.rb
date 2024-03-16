# frozen_string_literal: true

module Image
  class Component < ApplicationViewComponent
    attr_reader :path, :alt, :caption

    def initialize(path:, alt:, caption: nil)
      @path = path
      @alt = alt
      @caption = caption
    end
  end
end
