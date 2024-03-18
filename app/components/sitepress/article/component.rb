# frozen_string_literal: true

module Sitepress
  module Article
    class Component < ApplicationViewComponent
      with_collection_parameter :article
      attr_reader :article

      renders_one :reading_time, ReadingTime::Component

      def initialize(article)
        super

        @article = article
      end
    end
  end
end
