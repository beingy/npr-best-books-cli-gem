class NPRBestBooks::List

  attr_accessor :year, :name, :books, :list

  @@list_years = [ 2015 ]

  def self.latest
    puts "Loading latest list..."
    #should return a bunch of instances of Book with from latest year.
    if @list
      @list.books
    else
      @list = self.new
      @list.year = @@list_years.last
      @list.name= "#{@list.year}'s Great Reads"
      @list.books = NPRBestBooks::Scraper.books

      @list.books.each do |book_hash|
        book = NPRBestBooks::Book.new
        book.year = @list.year
        book.genres = book_hash["tags"]
        book.title = book_hash["title"]
        book.slug = book_hash["slug"]
        book.author = book_hash["author"]
        book.recommender = book_hash["reviewer"]
        book.bookreview = book_hash["text"]
        book.isbn = book_hash["isbn"]
        book.isbn13 = book_hash["isbn13"]
      end
      @list.books
    end
  end

  def self.science_fiction_and_fantasy
    # @list1 assigned to science_fiction_and_fantasy
    if @list1
      @list1.books.each do |book|
        puts "#{book.id}. #{book.title} by #{book.author}"
      end
      @list1.books
    else
      @list1 = self.new
      @list1.year = @@list_years.last
      @list1.name = "Science Fiction and Fantasy"
      @list1.books = NPRBestBooks::Book.science_fiction_and_fantasy
      book_id = 1
      @list1.books.each do |book|
        book.id = book_id
        book.amazonurl = NPRBestBooks::Book.lookup_amazonurl(book)
        puts "#{book.id}. #{book.title} by #{book.author}"
        book_id += 1
      end
      @list1.books
    end
  end

  def self.all_years
    @@list_years
  end

end
