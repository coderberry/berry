# frozen_string_literal: true

module Sitepress
  module ArticleCard
    class Component < ApplicationViewComponent
      with_collection_parameter :article
      attr_reader :article

      # @param [ArticleModel] article
      def initialize(article, **)
        super

        @article = article
      end
    end
  end
end
