class StudyItem
  attr_reader :id
  attr_accessor :title, :category

  @@next_id = 1

  def initialize(title:, category:)
    @id = @@next_id
    @title = title
    @category = category
    @@next_id += 1
  end

  def include?(query)
    title.include?(query) || category.include?(query)
  end

  def to_s
    "##{id} - #{title} - #{category}"
  end

  def self.register
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    print 'Digite a categoria do seu item de estudo: '
    category = gets.chomp
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    new(title: title, category: category)
  end

end
