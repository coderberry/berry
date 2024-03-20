# frozen_string_literal: true

module Demo::Tabs
  class Component < ApplicationViewComponent
    attr_reader :tabs

    def initialize(tabs:, **)
      super

      @tabs = tabs
    end
  end
end
