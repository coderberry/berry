# frozen_string_literal: true

module Demo::Tab
  class Component < ApplicationViewComponent
    attr_reader :tab_id, :label, :src

    def initialize(tab_id:, label:, src:, active: false, **)
      super

      @tab_id = tab_id
      @label = label
      @src = src
      @active = active
    end

    def tw_classes
      ret = ["inline-block w-full p-2 px-3 border-r border-gray-800"]
      ret << "bg-gray-700 text-gray-100" if active?
      ret << "bg-black text-gray-500 hover:text-gray-300 hover:bg-gray-800" unless active?
      ret.join(" ")
    end

    def active?
      @active
    end
  end
end
