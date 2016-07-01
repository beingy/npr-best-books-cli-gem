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
        book.booklength = "need to add booklength"
        book.amazonreview = "need to add amazonreview"
        book.amazonprice = "need to add amazonprice"
        puts "#{book.id}. #{book.title} by #{book.author}"
        book_id += 1
      end
      @list1.books
    end
  end

  def self.all_years
    @@list_years
  end

  def self.book_list(year = "2015" , genre = "Science Fiction & Fantasy")
    @books = []
    stub_book_list = self.stub_2015
    year_index = self.list_years.index(year)
    book_total = stub_book_list[year_index][:books]
    book_total.to_i.times do |i|
      @books << "Book #{i+1} from #{@year}"
    end
    @books
  end

  def self.list_years
    stub_list_years = self.stub
    @available_year = []
    stub_list_years.each do |hash|
      @available_year << hash[:year]
    end
    @available_year
  end

end
