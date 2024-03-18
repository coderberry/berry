class ArticleModel < Sitepress::Model
  collection glob: "blog/*.html.*"
  data :author, :banner_image_url, :published_at, :title, :tldr, :twitter_plugin

  # Returns the articles excluding the blog index page
  # @return [Array<ArticleModel>]
  def self.articles
    all.reject { |article| article.request_path == "/blog" }
  end

  def published?
    published_at && published_at <= Time.now
  end

  def publish_date
    published_at&.strftime("%B %d, %Y") || "Unpublished"
  end
end
