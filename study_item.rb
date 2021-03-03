class StudyItem
  attr_reader :id, :title, :category

  def initialize(id, title, category)
    @id = id
    @title = title
    @category = category
  end
end
