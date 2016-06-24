require 'pry'

class NPRBestBooks::CLI
  attr_accessor :year, :books

  def call
    @year = 2015
    @books = []
    list_books
    menu
  end

  def list_books
    puts "Welcome to NPR's Guide to #{@year}'s Great Reads"
    puts <<-DOC.gsub(/^\s*/, "")
      Latest recommendations in Science Fiction & Fantasy:
      (in alphabetical order)
      1. Ancillary Mercy by Ann Leckie
      2. Bitch Planet Vol. 1: Extraordinary Machine by Kelly Sue DeConnick, illustrated by Valentine De Landro
      3. ...
      57. Your Alien by Tammi Sauer, illustrated by Goro Fujita
    DOC

    57.times do |i|
      @books << i.to_s
    end

  end

  def menu
    puts "Enter the number of the book you'd want to learn more about:"
    puts "'exit' to end program, 'more' to see recommendations from previous years"
    print "  Command: "
    input = ""
    while input != "exit"
      input = gets.strip.downcase
      
      if input.to_i >= 1 && input.to_i <= @books.count
        puts "More info on book #{input}..."
        sub_menu
      elsif input.to_s == "list"
        list_books
        menu
      elsif input.to_s == "more"
        more_menu
      elsif input.to_s == "exit" || input.to_s == "bye" || input.to_s == "quit"
          puts "Exiting program..."
          goodbye
      else
          puts "Invalid command, please try again. Error on: '#{input}'."
      end

    end
  end

  def sub_menu
    puts "What do you like to do next?"
    puts "'list' to show book list again, 'more' to see recommendations from another year, 'exit' to end program."
    print "  Command: "
    input = ""
    while input != "exit" || input != "more" || input != "list"
      input = gets.strip.downcase
      if input.to_s == "list"
        list_books
        menu
      elsif input.to_s == "more"
        more_menu
      elsif input.to_s == "exit" || input.to_s == "bye" || input.to_s == "quit"
        puts "Exiting program..."
        goodbye
      else
        puts "Invalid command, please try again. Error on: '#{input}'."
      end

    end

  end

  def best_books_years
    available_years = [2013, 2014, 2015]
  end

  def change_year(year)
    @year = year
  end

  def other_years
    years = best_books_years
    other_years = years.select {|year| year != @year}
  end

  def more_menu
    select_years = []
    puts "Please select a year to look up more book recommendations:"
    other_years.each.with_index(1) do |year, index|
      puts "#{index}. #{year}"
      select_years << year 
    end
    print "  Command: "
    select_valid_year = false
    while select_valid_year != true
      input = gets.strip
      if select_years.include?(select_years[input.to_i-1])
        change_year(select_years[input.to_i-1])
        select_valid_year = true
      else
        puts "Invalid command. Please try again. Error on '#{input}'."
      end
    end
    list_books
    menu
  end

  def goodbye
    puts "Goodbye."
    exit
  end

end