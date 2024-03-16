# frozen_string_literal: true

class Blog::PostComponent < ViewComponent::Base
  attr_reader :page, :title, :published_at, :banner_image_url

  # @param resource [Sitepress::Resource]
  def initialize(resource)
    @page = resource[:page]
    data = page.data
    @title = data["title"]
    @published_at = data["published_at"].presence.strftime("%B %d, %Y")
    @banner_image_url= data["banner_image_url"]
  end
end
