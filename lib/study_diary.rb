# frozen_string_literal: true

require_relative 'study_item'
require 'readline'
require 'shellwords'

class StudyDiary

  attr_accessor :welcome, :help

  def initialize
    @collection = []

    @welcome = "Bem-vindo ao Diário de Estudos, seu companheiro para estudar!\n" \
               "Digite help para ver os comandos.\n\n"

    @help = <<~HELP
      register "title" "category"
          Cadastrar um item para estudar

      view
          Ver todos os itens cadastrados

      search "term"
          Buscar um item de estudo

      exit
          Sair
    HELP
  end


  def register(args)
    @collection.push(StudyItem.new(title: args[0], category: args[1]))
  end


  def print_items(collection = nil)
    collection ||= @collection
    if collection.empty?
      puts 'Nenhum item encontrado'
    else
      puts collection
    end
  end


  def search_items(term)
    found_items = @collection.filter do |item|
      item.include?(term.first)
    end
    print_items(found_items)
  end


  def repl
    puts welcome
    loop do
      args = Shellwords.split( Readline.readline('> ', true) )
      command = args.shift

      if    command == 'register'
        register(args)
      elsif command == 'view'
        print_items
      elsif command == 'search'
        search_items(args)
      elsif command == 'help'
        puts help
      elsif command == 'quit' || command == 'exit'
        break
      end
    end
  end
end




if $0 == __FILE__
  diary = StudyDiary.new
  diary.repl
end
