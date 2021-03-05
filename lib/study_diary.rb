# frozen_string_literal: true

require_relative 'study_item'
require 'readline'
require 'shellwords'

class StudyDiary
  def initialize
    @collection = []
  end

  def welcome
    puts 'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
    puts 'Digite help para ver os comandos.'
    puts
  end


  def help
    puts 'register "title" "category"'
    puts  '   Cadastrar um item para estudar'
    puts

    puts 'view'
    puts '    Ver todos os itens cadastrados'
    puts

    puts 'search "term"'
    puts '    Buscar um item de estudo'
    puts

    puts 'exit'
    puts '    Sair'
    puts
  end


  def print_items(collection = nil)
    collection ||= @collection
    if collection.empty?
      puts 'Nenhum item encontrado'
    else
      collection.each do |item|
        puts item
      end
    end
  end


  def search_items(term)
    found_items = @collection.filter do |item|
      item.include?(term)
    end
    print_items(found_items)
  end


  def repl
    welcome
    loop do
      option = Readline.readline('> ', true)
      args = Shellwords.split(option)

      if    args[0] == 'register'
        @collection.push(StudyItem.new(title: args[1], category: args[2]))
      elsif args[0] == 'view'
        print_items
      elsif args[0] == 'search'
        search_items(args[1])
      elsif args[0] == 'help'
        help
      elsif args[0] == 'quit' || args[0] == 'exit'
        break
      end
    end
  end
end




if $0 == __FILE__
  diary = StudyDiary.new
  diary.repl
end

