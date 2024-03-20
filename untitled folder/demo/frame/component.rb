# frozen_string_literal: true

module Demo::Frame
  class Component < ApplicationViewComponent
    attr_reader :src

    def initialize(src:, **)
      super

      @src = src
    end
  end
end
