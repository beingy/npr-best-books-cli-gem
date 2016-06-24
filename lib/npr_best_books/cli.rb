require 'pry'

class NPRBestBooks::CLI
  attr_accessor :year, :books, :current_book_id

  def call
    @year = 2015
    @books = []
    @current_book_id = ""
    list_books
    menu
  end

  def book_list(year)
    @books = []
    book_total = 57
    book_total.times do |i|
      @books << "Book #{i+1} from #{@year}"
    end
    @books
  end

  def list_books
    puts "+===> Welcome to NPR's Book Concierge <===+"
    puts "+=====> Guide to #{@year}'s Great Reads <=====+"
    puts "Science Fiction & Fantasy book recommendations in alphabetical order:"

    book_list(@year).each.with_index(1) {|book, index| puts "#{index}. #{book}"}
    puts "Total book recommendations from #{@year}: #{@books.count}"
  end

  def menu
    puts "Enter the number of the book you'd want to learn more about:"
    puts "'exit' to end program, 'more' to see recommendations from previous years"
    print "+==> Command: "
    input = ""
    while input != "exit"
      input = gets.strip.downcase
      
      if input.to_i >= 1 && input.to_i <= @books.count
        @current_book_id = input.to_i
        current_book_array_id = @current_book_id - 1
        puts "+=========================================+"
        puts "+= " + "list id: #{@current_book_id}, title: #{@books[current_book_array_id]}"
        puts "+= " + "Ancillary Mercy by Ann Leckie"
        puts "+= " + "Recommended by Genevieve Valentine, book critic"
        puts "+= " + "It would be a mistake to go into Ancillary Mercy hoping for the same lightning-strike of Ancillary Justice. The first installment of Ann Leckie's trilogy opened a world; by now, things are so complicated for protagonist Breq that all you can hope for is to be satisfied. Luckily, Mercy delivers. The world-building particularly shines in the machinations of this closing chapter, as Breq tries to use her new political powers to stop a war with all the weapons the Radchaai Empire has at its disposal: insinuation, shifting loyalties and the second-best tea set."
        puts "+= " + "ISBN-13: 978-0316246682"
        puts "+= " + "Paperback: 348 pages"
        puts "+= " + "Publisher: Orbit (October 5, 2015)"
        puts "+= " + "Average Amazon Customer Review: 4.3 out of 5 stars (233 reviews)"
        puts "+= " + "Amazon Buy New Price: $9.59"
        puts "+=========================================+"
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
          puts "Enter the number of the book you'd want to learn more about:"
          puts "'exit' to end program, 'more' to see recommendations from previous years"
          print "+==> Command: "
      end

    end
  end

  def sub_menu
    puts "What would you like to do next?"
    puts "'list' to show book list again, 'more' to see recommendations from another year, 'exit' to end program."
    print "+==> Command: "
    input = ""
    while input != "exit" || input != "more" || input != "list" || (input.to_i >= 1 && input.to_i <= @books.count)
      input = gets.strip.downcase
      if input.to_s == "list"
        list_books
        menu
      elsif input.to_s == "more"
        more_menu
      elsif input.to_s == "exit" || input.to_s == "bye" || input.to_s == "quit"
        puts "Exiting program..."
        goodbye
      elsif input.to_i >= 1 && input.to_i <= @books.count
        @current_book_id = input.to_i
        current_book_array_id = @current_book_id - 1
        puts "+=========================================+"
        puts "+= " + "list id: #{@current_book_id}, title: #{@books[current_book_array_id]}"
        puts "+= " + "Ancillary Mercy by Ann Leckie"
        puts "+= " + "Recommended by Genevieve Valentine, book critic"
        puts "+= " + "It would be a mistake to go into Ancillary Mercy hoping for the same lightning-strike of Ancillary Justice. The first installment of Ann Leckie's trilogy opened a world; by now, things are so complicated for protagonist Breq that all you can hope for is to be satisfied. Luckily, Mercy delivers. The world-building particularly shines in the machinations of this closing chapter, as Breq tries to use her new political powers to stop a war with all the weapons the Radchaai Empire has at its disposal: insinuation, shifting loyalties and the second-best tea set."
        puts "+= " + "ISBN-13: 978-0316246682"
        puts "+= " + "Paperback: 348 pages"
        puts "+= " + "Publisher: Orbit (October 5, 2015)"
        puts "+= " + "Average Amazon Customer Review: 4.3 out of 5 stars (233 reviews)"
        puts "+= " + "Amazon Buy New Price: $9.59"
        puts "+=========================================+"
        sub_menu   
      else
        puts "Invalid command, please try again. Error on: '#{input}'."
        puts "'list' to show book list again, 'more' to see recommendations from another year, 'exit' to end program."
        print "+==> Command: "
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
    puts "Please enter the number of the year for more book recommendations:"
    other_years.each.with_index(1) do |year, index|
      puts "#{index}. #{year}"
      select_years << year 
    end
    puts "'back' to go back to #{@year}'s book recommendations."
    print "+==> Command: "
    select_valid_year = false
    while select_valid_year != true
      input = gets.strip
      if select_years.include?(select_years[input.to_i-1])
        change_year(select_years[input.to_i-1])
        select_valid_year = true
      elsif input == "stay" || input == "back"
        change_year(@year)
        select_valid_year = true
      else
        puts "Invalid command. Please try again. Error on '#{input}'."
        puts "Please enter the number of the year for more book recommendations:"
        other_years.each.with_index(1) do |year, index|
          puts "#{index}. #{year}"
          select_years << year 
        end
        print "+==> Command: "
      end
    end
    list_books
    menu
  end

  def goodbye
    puts "Thank you for checking out NPR's Book Concierge. Goodbye!"
    exit
  end

end