# frozen_string_literal: true

require "test_helper"

module Container
  class ComponentTest < ViewComponent::TestCase
    def test_renders
      component = build_component

      render_inline(component)

      assert_selector "div"
    end

    private

    def build_component(**)
      Container::Component.new(**)
    end
  end
end
