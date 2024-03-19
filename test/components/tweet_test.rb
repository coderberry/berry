# frozen_string_literal: true

require "test_helper"

module Tweet
  class ComponentTest < ViewComponent::TestCase
    def test_renders
      component = build_component

      render_inline(component)

      assert_selector "div"
    end

    private

    def build_component(**)
      Tweet::Component.new(**)
    end
  end
end
