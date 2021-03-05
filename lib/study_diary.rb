# frozen_string_literal: true

require_relative 'study_item'


class StudyDiary

  REGISTER = 1
  VIEW     = 2
  SEARCH   = 3
  EXIT     = 4

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

  def print_items(collection)
    if collection.empty?
      puts 'Nenhum item encontrado'
    else
      collection.each do |item|
        puts item
      end
    end
  end

  def search_items(collection)
    print 'Digite uma palavra para procurar: '
    term = gets.chomp
    found_items = collection.filter do |item|
      item.include?(term)
    end
    print_items(found_items)
  end
end



def clear
  system('clear')
end

def wait_keypress
  puts
  puts 'Pressione enter para continuar'
  gets
end

def wait_keypress_then_clear
  wait_keypress
  clear
end



if $0 == __FILE__
  study_diary = StudyDiary.new
  study_items = []

  clear()
  puts study_diary.welcome
  option = 0

  begin
    clear()
    option = study_diary.menu

    case option
    when StudyDiary::REGISTER
      study_items << StudyItem.register
    when StudyDiary::VIEW
      study_diary.print_items(study_items)
    when StudyDiary::SEARCH
      study_diary.search_items(study_items)
    end
    wait_keypress_then_clear
  end until StudyDiary::EXIT == option
end
