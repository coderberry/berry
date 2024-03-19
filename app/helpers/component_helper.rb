module ComponentHelper
  # Dir[Rails.root.join("app/components/**/*.rb")].each { |file| require file }

  # Helper shortcuts to render view components.
  # All components are prefixed with `c_` to avoid conflicts with other helper methods.
  #
  # Example:
  #   <%= c_container(PageModel.new(current_page) do |c| %>
  #     <%= c_sitepress_article(ArticleModel.new(current_page)) do |article| %>
  #       <%= c_article_card.with_collection(page.articles) %>
  #     <% end %>
  #   <% end %>

  COMPONENT_HELPERS = {
    container: "Container::Component",
    image: "Image::Component",
    image_caption: "ImageCaption::Component",
    markdown: "Markdown::Component",
    reading_time: "ReadingTime::Component",
    sitepress_article: "Sitepress::Article::Component",
    sitepress_article_card: "Sitepress::ArticleCard::Component",
    sitepress_breadrumbs: "Sitepress::Breadcrumbs::Component",
    sitepress_page: "Sitepress::Page::Component",
    scroll_to_top: "ScrollToTop::Component",
    title: "Title::Component",
    tweet: "Tweet::Component"
  }.freeze

  # standard:enable Layout/HashAlignment
  COMPONENT_HELPERS.each do |name, component|
    puts "COMPONENT: #{component.inspect}"
    define_method :"c_#{name}" do |*args, **kwargs, &block|
      # puts "RENDERING: #{ "::#{component}".constantize}"
      render component.constantize.new(*args, **kwargs), &block
    end
  end
end
