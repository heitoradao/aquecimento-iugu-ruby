# frozen_string_literal: true

require_relative 'study_item'

REGISTER = 1
VIEW     = 2
SEARCH   = 3
EXIT     = 4

def clear
  system('clear')
end

def wait_keypress
  puts
  puts 'Pressione enter para continuar'
  gets
end

def clear_and_wait_keypress
  wait_keypress
  clear
end

def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def menu
  puts "[#{REGISTER}] Cadastrar um item para estudar"
  puts "[#{VIEW}] Ver todos os itens cadastrados"
  puts "[#{SEARCH}] Buscar um item de estudo"
  puts "[#{EXIT}] Sair"
  print 'Escolha uma opção: '
  gets.to_i
end

def register_study_item(id)
  print 'Digite o título do seu item de estudo: '
  title = gets.chomp
  print 'Digite a categoria do seu item de estudo: '
  category = gets.chomp
  puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
  StudyItem.new(title, category)
end

def print_items(collection)
  collection.each do |item|
    puts "##{item.id} - #{item.title} - #{item.category}"
  end
  puts 'Nenhum item encontrado' if collection.empty?
end

def search_items(collection)
  print 'Digite uma palavra para procurar: '
  term = gets.chomp
  found_items = collection.filter do |item|
    item.title.include?(term)
  end
  print_items(found_items)
end

clear
puts welcome
study_items = []
option = menu
index = 1

loop do
  clear
  case option
  when REGISTER
    study_items << register_study_item(index)
    index  += 1
  when VIEW
    print_items(study_items)
  when SEARCH
    search_items(study_items)
  when EXIT
    clear
    puts 'Obrigado por usar o Diário de Estudos'
    break
  else
    puts 'Opção inválida'
  end
  clear_and_wait_keypress
  option = menu
end
