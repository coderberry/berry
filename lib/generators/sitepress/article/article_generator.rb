# frozen_string_literal: true

require "rails/generators"

class Sitepress::ArticleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def create_sitemap_article_file
    template "article.html.erb", File.join("app/content/pages/blog/#{file_name}.html.erb")
  end
end
