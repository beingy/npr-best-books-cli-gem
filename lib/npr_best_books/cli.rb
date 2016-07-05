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
      puts "\r#{@year}'s Science Fiction & Fantasy recommendations:"
      @list = NPRBestBooks::List.science_fiction_and_fantasy
      puts "Total #{@year} NPR Science Fiction & Fantasy recommendations: #{@list.count} books"
    else
      NPRBestBooks::List.latest
      puts "\r#{@year}'s Science Fiction & Fantasy recommendations:"
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
        puts "=> " + "List ID: #{@current_book_id}"
        puts "=> " + "Title: #{@list[current_book_array_id].title}"
        puts "=> " + "Author: #{@list[current_book_array_id].author}"
        puts "=> " + "Recommended by: #{@list[current_book_array_id].recommender}"
        puts "=> " + "Book Review:"
        bookreview = @list[current_book_array_id].bookreview
        bookreview = bookreview.gsub("<em>","\_")
        bookreview = bookreview.gsub("</em>","\_")
        bookreview_linewrap(bookreview)
        puts "=> " + "ISBN: #{@list[current_book_array_id].isbn}, ISBN-13 #{@list[current_book_array_id].isbn13}"
        puts "=> " + "Average Amazon Customer Reviews:"
        begin
          print "   " + "Loading Amazon Ratings..."
          NPRBestBooks::Book.lookup_amazonreviews(@list[current_book_array_id])
          puts "\r   " + "#{@list[current_book_array_id].amazonratings} (#{@list[current_book_array_id].amazonreviews} Reviews)"
        rescue OpenURI::HTTPError => error
          puts "\r   " + "Data currently unavailable (#{error}). Try again later."
        end
        puts "================================================================================"
        sub_menu
      elsif input.to_s == "list"
        list_books
        menu
      elsif input.to_s == "exit" || input.to_s == "bye" || input.to_s == "quit"
          puts "Exiting program..."
          goodbye
      else
          puts "Invalid command, please try again. Error on: '#{input}'."
          puts "Enter the 'number' of the book you'd want to learn more about, or:"
          puts "'exit' to end program"
          print "==> Command: "
      end
    end
  end

  def sub_menu
    puts "What would you like to do next? Here are your options:"
    puts "Enter a book 'number' from the list to learn more, 'list' to show book list again, 'exit' to end program."
    print "==> Command: "
    input = ""
    while input != "exit" || input != "list" || (input.to_i >= 1 && input.to_i <= @list.count)
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
        puts "=> " + "List ID: #{@current_book_id}"
        puts "=> " + "Title: #{@list[current_book_array_id].title}"
        puts "=> " + "Author: #{@list[current_book_array_id].author}"
        puts "=> " + "Recommended by: #{@list[current_book_array_id].recommender}"
        puts "=> " + "Book Review:"
        bookreview = @list[current_book_array_id].bookreview
        bookreview = bookreview.gsub("<em>","")
        bookreview = bookreview.gsub("</em>","")
        bookreview_linewrap(bookreview)
        puts "=> " + "ISBN: #{@list[current_book_array_id].isbn}, ISBN-13 #{@list[current_book_array_id].isbn13}"
        puts "=> " + "Average Amazon Customer Reviews:"
        begin
          print "   " + "Loading Amazon Ratings..."
          NPRBestBooks::Book.lookup_amazonreviews(@list[current_book_array_id])
          puts "\r   " + "#{@list[current_book_array_id].amazonratings} (#{@list[current_book_array_id].amazonreviews} Reviews)"
        rescue OpenURI::HTTPError => error
          puts "\r   " + "Data currently unavailable (#{error}). Try again later."
        end
        puts "================================================================================"
        sub_menu
      else
        puts "Invalid command, please try again. Error on: '#{input}'."
        puts "'list' to show book list again, 'exit' to end program."
        print "==> Command: "
      end

    end

  end

  def bookreview_linewrap(string, linewrap_length = 75)
    string_wrapped = string.scan(/\S.{0,#{linewrap_length}}\S(?=\s|$)|\S+/)
    string_wrapped.each {|line| puts "   " + "#{line}"}
  end

  def goodbye
    puts "Thank you for checking out NPR's Book Concierge. Goodbye!"
    exit
  end

end
