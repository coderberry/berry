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

  # Auto-build helper methods for all components
  Dir[Rails.root.join("app/components/**/component.rb")].each do |component_path|
    component_sub_path = component_path.to_s.split("app/components/").last.gsub("/component.rb", "")
    path_parts = component_sub_path.split("/")
    helper_method = "c_#{path_parts.join("_")}"
    component_class = "#{path_parts.map(&:camelize).join("::").constantize}::Component"

    define_method :"#{helper_method}" do |*args, **kwargs, &block|
      render component_class.constantize.new(*args, **kwargs), &block
    end
  end
end
