module CodeHelper
  # Read the source code of the path provided.
  # The code is cached and will update on file change
  #
  # @param relative_path [String] the relative path to the file
  # @param erb [Symbol] the language of the source code
  # @return [String] the source code
  def read_source(relative_path, erb: false)
    absolute_path = Rails.root.join(relative_path)
    raise "File not found: #{absolute_path}" unless File.exist?(absolute_path)

    cache_key = "#{relative_path}/#{File.mtime(absolute_path).iso8601}"
    source = Rails.cache.fetch(cache_key) { File.read(absolute_path) }
    return source unless erb

    ERB.new(source).result(binding)
  end

  # Render the source code with Rouge
  #
  # @param source_code [String] the source code
  # @param language [Symbol] the language of the source code
  # @return [String] the HTML formatted source code
  def render_source_code(source_code, language:)
    formatter = Rouge::Formatters::HTML.new

    lexer = case language
            when :bash, :sh, :shell then Rouge::Lexers::Shell.new
            when :erb then Rouge::Lexers::ERB.new
            when :htm, :html then Rouge::Lexers::HTML.new
            when :js, :javascript then Rouge::Lexers::Javascript.new
            when :json then Rouge::Lexers::JSON.new
            when :rb, :ruby then Rouge::Lexers::Ruby.new
            end

    clean_source_code = cleanup_source_code(source_code, javascript: language == :js)

    tag.pre class: "" do
      formatter.format(lexer.lex(clean_source_code)).html_safe
    end
  end

  private

  def cleanup_source_code(source_code, javascript: false)
    if javascript
      # Remove the dispatchConsoleEvent line from the source code
      # This code is used to display console events to the demo console frame
      source_code.gsub(%r{^.+dispatchConsoleEvent.+$\n}, "")
    else
      source_code
    end
  end
end
