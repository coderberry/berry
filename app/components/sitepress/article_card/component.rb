# frozen_string_literal: true

module Sitepress
  module ArticleCard
    class Component < ApplicationViewComponent
      attr_reader :post, :title, :banner_image_url, :published_at, :author, :tldr

      def initialize(resource)
        @post = resource
        @title = resource.data["title"]
        @tldr = resource.data["tldr"]
        @author = resource.data["author"]
        @banner_image_url = resource.data["banner_image_url"]
        @published_at = resource.data["published_at"].presence.strftime("%B %d, %Y")
      end
    end
  end
end
