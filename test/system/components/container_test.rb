# frozen_string_literal: true

require "application_system_test_case"

module Container
  class ComponentSystemTest < ApplicationSystemTestCase
    def test_default_preview
      visit("/rails/view_components/sitepress//container/default")

      # assert_text "Hello!"
      # click_on("Click me!")
      # assert_text "Good-bye!"
    end
  end
end
