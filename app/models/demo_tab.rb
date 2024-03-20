class DemoTab
  attr_reader :name, :variant, :id, :label, :path, :active

  BASE_TW_CLASSES = %w[inline-block w-full p-2 px-3 border-r border-gray-800].freeze
  ACTIVE_TW_CLASSES = %w[bg-gray-700 text-gray-100].freeze
  INACTIVE_TW_CLASSES = %w[bg-black text-gray-500 hover:text-gray-300 hover:bg-gray-800].freeze

  def initialize(name:, variant:, id:, label:, path:, active: false)
    @name = name
    @variant = variant
    @id = id
    @label = label
    @path = path
    @active = active
  end

  # Tailwind classes for the tab
  # @return [String] the tailwind classes
  def tw_classes
    [
      BASE_TW_CLASSES,
      active? ? ACTIVE_TW_CLASSES : INACTIVE_TW_CLASSES
    ].join(" ")
  end

  # @return [Boolean] whether the tab is active
  def active?
    active
  end
end
