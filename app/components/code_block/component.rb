# frozen_string_literal: true

require "rouge"

module CodeBlock
  class Component < ApplicationViewComponent
    attr_reader :path, :language, :source

    renders_one :source_code

    ACCEPTED_LANGUAGES = %i[bash sh shell erb html js json rb ruby xml].freeze

    def initialize(path: nil, language: nil, **)
      super

      raise ArgumentError, "Invalid language: #{language}" unless ACCEPTED_LANGUAGES.include?(language.to_sym)

      if path
        raise ArgumentError, "Invalid path: #{path}" unless File.exist?(Rails.root.join(path))
      end

      @path = path
      @language = language ? language.to_sym : determine_language
      @source = nil

      @source = read_source if path
      @source ||= source_code if source_code?
      @source ||= content if content?
      @source ||= "<h3>MISSING</h3>"

      clean_source
      render_source
    end

    private

    def determine_language
      case File.extname(path)
      when ".bash", ".sh", ".shell" then :bash
      when ".erb" then :erb
      when ".htm", ".html" then :html
      when ".js", ".javascript" then :js
      when ".json" then :json
      when ".rb", ".ruby" then :rb
      when ".xml" then :xml
      else
        raise ArgumentError, "Could not determine language for #{path}"
      end
    end

    def read_source
      cache_key = "#{path}/#{File.mtime(Rails.root.join(path)).iso8601}"
      Rails.cache.fetch(cache_key) { File.read(Rails.root.join(path)) }
    end

    def clean_source
      # remove initial whitespaces and empty lines
      @source = source.gsub(/\A\s+/, "")

      if language == :js
        # remove the dispatchConsoleEvent lines
        @source = source.gsub(%r{^.+dispatchConsoleEvent.+$\n}, '')
      end
    end

    def render_source
      formatter = Rouge::Formatters::HTML.new

      lexer = case language
              when :bash, :sh, :shell then Rouge::Lexers::Shell.new
              when :erb then Rouge::Lexers::ERB.new
              when :htm, :html then Rouge::Lexers::HTML.new
              when :js, :javascript then Rouge::Lexers::Javascript.new
              when :json then Rouge::Lexers::JSON.new
              when :rb, :ruby then Rouge::Lexers::Ruby.new
              when :xml then Rouge::Lexers::XML.new
              end

      @source = formatter.format(lexer.lex(source)).html_safe
    end
  end
end
