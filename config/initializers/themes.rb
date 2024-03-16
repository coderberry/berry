# These are themes for the MarkdownComponent (using the commonmarker gem)
# All themes exist in the vendor/themes directory
# Source: https://github.com/filmgirl/TextMate-Themes

THEMES = YAML.load_file(Rails.root.join("config/themes.yml")).freeze
