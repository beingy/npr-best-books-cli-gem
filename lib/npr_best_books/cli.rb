require 'pry'

class NPRBestBooks::CLI
  attr_accessor :current_book_id, :list, :year

  def call
    latest_year = NPRBestBooks::List.all_years.last
    @year = latest_year
    @current_book_id = ""
    welcome
    list_books
    menu
  end

  def welcome
    puts "== Welcome to NPR's Book Concierge =="
    puts "== A Guide to #{@year}'s Great Reads =="
  end

  def list_books
    if @list
      puts "#{@year}'s Science Fiction & Fantasy recommendations:"
      @list = NPRBestBooks::List.science_fiction_and_fantasy
      puts "Total #{@year} NPR Science Fiction & Fantasy recommendations: #{@list.count} books"
    else
      NPRBestBooks::List.latest
      puts "#{@year}'s Science Fiction & Fantasy recommendations:"
      @list = NPRBestBooks::List.science_fiction_and_fantasy
      puts "Total #{@year} NPR Science Fiction & Fantasy recommendations: #{@list.count} books"
    end
  end

  def menu
    puts "Enter the 'number' of the book you'd like to learn more about, or:"
    puts "'exit' to end program, 'more' to see recommendations from other years"
    print "==> Command: "
    input = ""
    while input != "exit"
      input = gets.strip.downcase
      
      if input.to_i >= 1 && input.to_i <= @list.count
        @current_book_id = input.to_i
        current_book_array_id = @current_book_id - 1
        puts "================================================================================"
        puts "=> " + "list id: #{@current_book_id}, title: #{@list[current_book_array_id].title}"
        puts "=> " + "Title: #{@list[current_book_array_id].title}"
        puts "=> " + "Author: #{@list[current_book_array_id].author}"
        puts "=> " + "Recommended by: #{@list[current_book_array_id].recommender}"
        puts "=> " + "Book Review:"
        bookreview = @list[current_book_array_id].bookreview
        bookreview_linewrap(bookreview)
        puts "=> " + "ISBN: #{@list[current_book_array_id].isbn}, (ISBN-13 #{@list[current_book_array_id].isbn13})"
        puts "=> " + "Paperback: #{@list[current_book_array_id].booklength}"
        puts "=> " + "Publisher: #{@list[current_book_array_id].publisher}"
        puts "=> " + "Average Amazon Customer Review:"
        puts "   " + "#{@list[current_book_array_id].amazonreview}"
        puts "=> " + "Amazon Buy New Price: #{@list[current_book_array_id].amazonprice}"
        puts "================================================================================"
        sub_menu
      elsif input.to_s == "list"
        list_books
        menu
      # elsif input.to_s == "more"
      #   more_menu
      elsif input.to_s == "exit" || input.to_s == "bye" || input.to_s == "quit"
          puts "Exiting program..."
          goodbye
      else
          puts "Invalid command, please try again. Error on: '#{input}'."
          puts "Enter the 'number' of the book you'd want to learn more about, or:"
          puts "'exit' to end program"
          # 'more' to see recommendations from other years
          print "==> Command: "
      end

    end
  end

  def sub_menu
    puts "What would you like to do next? Here are your options:"
    puts "Enter a book 'number' from the list to learn more, 'list' to show book list again, 'more' to see recommendations from another year, 'exit' to end program."
    print "==> Command: "
    input = ""
    while input != "exit" || input != "more" || input != "list" || (input.to_i >= 1 && input.to_i <= @list.count)
      input = gets.strip.downcase
      if input.to_s == "list"
        list_books
        menu
      elsif input.to_s == "more"
        more_menu
      elsif input.to_s == "exit" || input.to_s == "bye" || input.to_s == "quit"
        puts "Exiting program..."
        goodbye
      elsif input.to_i >= 1 && input.to_i <= @list.count
        @current_book_id = input.to_i
        current_book_array_id = @current_book_id - 1
        puts "================================================================================"
        puts "=> " + "list id: #{@current_book_id}, title: #{@list[current_book_array_id].title}"
        puts "=> " + "Title: #{@list[current_book_array_id].title}"
        puts "=> " + "Author: #{@list[current_book_array_id].author}"
        puts "=> " + "Recommended by: #{@list[current_book_array_id].recommender}"
        puts "=> " + "Book Review:"
        bookreview = @list[current_book_array_id].bookreview
        bookreview_linewrap(bookreview)
        puts "=> " + "ISBN: #{@list[current_book_array_id].isbn}, (ISBN-13 #{@list[current_book_array_id].isbn13})"
        puts "=> " + "Paperback: #{@list[current_book_array_id].booklength}"
        puts "=> " + "Publisher: #{@list[current_book_array_id].publisher}"
        puts "=> " + "Average Amazon Customer Review:"
        puts "   " + "#{@list[current_book_array_id].amazonreview}"
        puts "=> " + "Amazon Buy New Price: #{@list[current_book_array_id].amazonprice}"
        puts "================================================================================"
        sub_menu   
      else
        puts "Invalid command, please try again. Error on: '#{input}'."
        puts "'list' to show book list again, 'exit' to end program."
        # 'more' to see recommendations from another year,
        print "==> Command: "
      end

    end

  end

  def bookreview_linewrap(string, linewrap_length = 75)
    string_wrapped = string.scan(/\S.{0,#{linewrap_length}}\S(?=\s|$)|\S+/)
    string_wrapped.each {|line| puts "   " + "#{line}"}
  end

  # def list_years
  #   available_years = NPRBestBooks::List.all_years
  # end

  # def change_year(year)
  #   @year = year
  # end

  # def list_other_years
  #   years = list_years
  #   list_other_years = years.select {|year| year != @year}
  # end

  # def more_menu
  #   select_years = []
  #   puts "Please enter the number of the year for more book recommendations:"
  #   list_other_years.each.with_index(1) do |year, index|
  #     puts "#{index}. #{year}"
  #     select_years << year 
  #   end
  #   puts "'back' to go back to #{@year}'s book recommendations."
  #   print "==> Command: "
  #   select_valid_year = false
  #   while select_valid_year != true
  #     input = gets.strip
  #     if select_years.include?(select_years[input.to_i-1])
  #       change_year(select_years[input.to_i-1])
  #       select_valid_year = true
  #     elsif input == "stay" || input == "back"
  #       change_year(@year)
  #       select_valid_year = true
  #     else
  #       puts "Invalid command. Please try again. Error on '#{input}'."
  #       puts "Please enter the number of the year for more book recommendations:"
  #       list_other_years.each.with_index(1) do |year, index|
  #         puts "#{index}. #{year}"
  #         select_years << year 
  #       end
  #       print "==> Command: "
  #     end
  #   end
  #   list_books
  #   menu
  # end

  def goodbye
    puts "Thank you for checking out NPR's Book Concierge. Goodbye!"
    exit
  end

end