class ArticleModel < Sitepress::Model
  include ModelRelationships

  collection glob: "blog/*.html.*"
  data :author, :banner_image_url, :published_at, :title, :tldr, :twitter_plugin, :breadcrumb

  # Returns the articles excluding the blog index page
  # @return [Array<ArticleModel>]
  def self.articles
    all.reject(&:exclude?)
      .sort_by { |article| article.published? ? article.published_at : Time.now }
      .reverse
  end

  def exclude?
    return true if request_path == "/blog"

    publish_date == "Unpublished" && (Rails.env.production? || ENV["GENERATING_SITEMAP"] == "true")
  end

  def published?
    published_at && published_at <= Time.now
  end

  def publish_date
    published_at&.strftime("%B %d, %Y") || "Unpublished"
  end
end
