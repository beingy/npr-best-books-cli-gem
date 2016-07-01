require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

require 'pry'

class NPRBestBooks::Scraper

  def self.books
    puts "Loading books..."
    html = Nokogiri::HTML(open("http://web.archive.org/web/20160622040558/http://apps.npr.org/best-books-2015/"))
    html_script_data = html.css("script").select {|s| s.children.text.include?("BOOKS") }
    script_data = html_script_data[0].children.text
    all_books = self.parse_data(script_data)
    parsed = JSON.parse(all_books)
  end

  def self.parse_data(data)
    part1 = data.gsub("\n    window.BOOKS = [{","[{")
    part2 = part1.gsub("}];","}]")
    part3 = part2.gsub("ANALYTICS.setupChartbeat();","")
    part3
  end

  def self.lookup_amazon(book)
    amazon_html = Nokogiri::HTML(open(book.amazonurl))
    amazon_html
  end

end