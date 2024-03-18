# frozen_string_literal: true

module ReadingTime
  class Component < ApplicationViewComponent
    attr_reader :minutes

    def initialize(markdown)
      super

      words_per_minute = 180
      words = markdown.split.size
      @minutes = (words / words_per_minute).floor
    end
  end
end
