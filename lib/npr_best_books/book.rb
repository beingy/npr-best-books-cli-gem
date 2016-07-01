class NPRBestBooks::Book
  attr_accessor :id, :title, :slug, :author, :genres, :year, :recommender, :bookreview, :publisher, :isbn, :isbn13, :booklength, :amazonurl, :amazonreview, :amazonprice, :url

  @@books = []

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

end