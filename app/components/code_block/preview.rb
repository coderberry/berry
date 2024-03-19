# frozen_string_literal: true

module CodeBlock
  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    RUBY_SOURCE_CODE = <<~RUBY
      class Example
        def hello
          "Hello CodeBlock!
        end
      end
    RUBY

    def default
      render CodeBlock::Component.new(language: :ruby) { RUBY_SOURCE_CODE }
    end

    def with_source_code
      render CodeBlock::Component.new(language: :ruby) do |code_block|
        code_block.with_source_code { RUBY_SOURCE_CODE }
      end
    end

    def erb_file
      path = "app/views/application/_footer.html.erb"

      render CodeBlock::Component.new(path: path, language: :erb)
    end
  end
end
