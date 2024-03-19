# frozen_string_literal: true

module Markdown
  class Component < ApplicationViewComponent
    THEME_PATH = Rails.root.join("vendor/themes").to_s.freeze

    def initialize(theme: "silverwind")
      raise ArgumentError, "Invalid theme [#{theme}]" unless THEMES.include?(theme.to_s)

      @theme = theme.to_s

      super
    end

    private

    def markdown_content(markdown)
      markdown_without_leading_spaces = markdown.gsub(/^ +(?=\S)/, "")

      Commonmarker.to_html(
        markdown_without_leading_spaces,
        options: commonmarker_options,
        plugins: {
          syntax_highlighter: {
            theme: @theme,
            path: THEME_PATH
          }
        }
      ).html_safe
    end

    def commonmarker_options
      {
        parse: {
          smart: false,
          default_info_string: ""
        },
        render: {
          hardbreaks: true,
          github_pre_lang: true,
          width: 80,
          unsafe: true, # Allow raw HTML - see https://github.github.com/gfm/#html-block
          escape: false,
          sourcepos: false
        },
        extension: {
          strikethrough: true,
          tagfilter: true,
          table: true,
          autolink: true,
          tasklist: true,
          superscript: false,
          header_ids: "",
          footnotes: false,
          description_lists: false,
          front_matter_delimiter: "",
          shortcodes: true
        },
        format: [:html]
      }
    end
  end
end
