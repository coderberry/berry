# frozen_string_literal: true

class UI::MarkdownComponent < ::BaseComponent
  THEME_PATH = Rails.root.join("vendor/themes").to_s.freeze

  def initialize(markdown:, theme: "silverwind")
    raise ArgumentError, "Invalid theme [#{theme}]" unless THEMES.include?(theme.to_s)

    @html =
      Commonmarker.to_html(
        markdown,
        options: commonmarker_options,
        plugins: {
          syntax_highlighter: {
            theme: theme,
            path: THEME_PATH
          }
        }
      )
  end

  def call
    @html.html_safe
  end

  private

  def commonmarker_options
    {
      parse: {
        smart: false,
        default_info_string: "",
      },
      render: {
        hardbreaks: true,
        github_pre_lang: true,
        width: 80,
        unsafe: true, # Allow raw HTML - see https://github.github.com/gfm/#html-block
        escape: false,
        sourcepos: false,
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
        shortcodes: true,
      },
      format: [:html]
    }
  end
end
