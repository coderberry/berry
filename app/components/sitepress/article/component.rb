# frozen_string_literal: true

module Sitepress
  module Article
    class Component < ApplicationViewComponent
      attr_reader :article

      with_collection_parameter :article

      renders_one :reading_time, ReadingTime::Component

      def initialize(article, render_reading_time: true, **)
        super

        @article = article
        @render_reading_time = render_reading_time
      end

      def render_reading_time?
        @render_reading_time
      end
    end
  end
end
