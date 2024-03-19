module ModelRelationships
  def parent
    page.parent ? self.class.new(page.parent) : nil
  end

  def siblings
    page.siblings.map { |s| self.class.new(s) }
  end

  def parents
    page.parents.map { |p| self.class.new(p) }
  end

  def children
    page.children.map { |c| self.class.new(c) }
  end
end
