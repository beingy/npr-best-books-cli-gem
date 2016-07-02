class NPRBestBooks::Book
  attr_accessor :id, :title, :slug, :author, :genres, :year, :recommender, :bookreview, :isbn, :isbn13, :amazonurl, :amazonratings, :amazonreviews

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

  def self.lookup_amazonurl(book)
    book.amazonurl = "https://www.amazon.com/dp/" + book.isbn
    book.amazonurl
  end

  def self.lookup_amazonreviews(book)
    amazon_url = "https://www.amazon.com/gp/search?keywords=" + book.isbn
    if !book.amazonratings && !book.amazonreviews
      amazon_html = NPRBestBooks::Scraper.lookup_amazon(amazon_url) 
      book.amazonratings = amazon_html.css("span[name='#{book.isbn}'] span.a-icon-alt").children.text
      book.amazonreviews = amazon_html.css("div[class='a-row a-spacing-mini']").css("a[class='a-size-small a-link-normal a-text-normal']")[0].children.text
    end
  end

end