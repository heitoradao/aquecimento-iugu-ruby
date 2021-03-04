class StudyItem
  attr_reader :id, :title, :category

  @@next_id = 1

  def initialize(title:, category:)
    @id = @@next_id
    @title = title
    @category = category
    @@next_id += 1
  end

end
