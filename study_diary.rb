def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def menu
  puts "[1] Cadastrar um item para estudar"
  puts "[2] Ver todos os itens cadastrados"
  puts "[3] Buscar um item de estudo"
  puts "[4] Sair"
  print 'Escolha uma opção: '
  gets.to_i
end

def register_study_item
  print 'Digite o título do seu item de estudo: '
  title = gets.chomp
  print 'Digite a categoria do seu item de estudo: '
  category = gets.chomp
  puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
  { title: title, category: category }
end

puts welcome
study_items = []
option = menu

while option != 4
  if option == 1
    study_items << register_study_item
  elsif option == 2
    study_items.each_with_index do |item, index|
      puts "##{index + 1} - #{item[:title]} - #{item[:category]}"
    end
    puts 'Nenhum item cadastrado' if study_items.empty?
  elsif option == 3
    print 'Digite uma palavra para procurar: '
    term = gets.chomp
    found_items = study_items.filter do |item|
      item[:title].include?(term)
    end
    puts found_items
    puts 'Nenhum item encontrado' if found_items.empty?
  else
    puts 'Opção inválida'
  end
  option = menu
end

puts 'Obrigado por usar o Diário de Estudos'