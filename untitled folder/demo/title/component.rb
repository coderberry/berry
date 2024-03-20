# frozen_string_literal: true

module Demo::Title
  class Component < ApplicationViewComponent
    attr_reader :title

    def initialize(title, **)
      super

      @title = title
    end
  end
end
