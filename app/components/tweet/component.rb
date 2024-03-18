# frozen_string_literal: true

module Tweet
  class Component < ApplicationViewComponent
    attr_reader :theme, :author, :handle, :link, :date_published

    def initialize(author:, handle:, date_published:, link:, dark_mode: true)
      super

      @theme = dark_mode ? "dark" : "light"
      @author = author
      @handle = handle.start_with?("@") ? handle : "@#{handle}"
      @link = link
      @date_published = date_published
    end
  end
end
