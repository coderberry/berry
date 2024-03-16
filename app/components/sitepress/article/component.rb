# frozen_string_literal: true

module Sitepress
  module Article
    class Component < ApplicationViewComponent
      attr_reader :page, :data, :title, :published_at, :banner_image_url

      def initialize(page)
        @page = page
        @data = page.data
        @title = data["title"]
        @published_at = data["published_at"].presence.strftime("%B %d, %Y")
        @banner_image_url = data["banner_image_url"]
      end
    end
  end
end
