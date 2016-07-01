require 'rubygems'
require 'json'
require 'net/http'

# Define the URL with the argument passed by the user
uri = "http://www.foodnetwork.com/recipes/photos/recipe-of-the-day-what-to-cook-now.html"

# Perform the HTTP GET request, and return the response
resp = Net::HTTP.get_response(URI.parse(uri))

# Parse the JSON from the response body
jresp = JSON.parse(resp.body)
binding.pry
# Emit the content of interest
puts jresp['number_of_employees']