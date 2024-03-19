# frozen_string_literal: true

module ReadingTime
  class Component < ApplicationViewComponent
    attr_reader :minutes

    # @param [String] contents
    def initialize(contents)
      super

      words_per_minute = 180
      words = contents.split.size
      @minutes = (words / words_per_minute).floor
    end
  end
end
