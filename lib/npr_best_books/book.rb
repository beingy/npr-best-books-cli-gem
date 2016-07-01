class NPRBestBooks::Book
  attr_accessor :id, :title, :slug, :author, :genres, :year, :recommender, :bookreview, :publisher, :isbn, :isbn13, :booklength, :amazonurl, :amazonreview, :amazonprice

  @@books = []

  AMAZON_BASE_URL = "https://www.amazon.com/dp/"

  def initialize
    @@books << self
  end

  def self.all
    @@books
  end

  def self.science_fiction_and_fantasy
    books = self.all.select {|book| book.genres.include?("science-fiction-and-fantasy")}
    books
  end

  def self.lookup_amazonurl(book)
    book.amazonurl = AMAZON_BASE_URL + book.isbn
    book.amazonurl
  end

  def self.lookup_publisher(book)
    if book.publisher
      book.publisher
    else
      # amazon_html = NPRBestBooks::Scraper.lookup_amazon(book)
      book.publisher = "Stub Publisher"
      book.publisher
    end
  end

end