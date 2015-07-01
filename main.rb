#test
require 'rubygems'
require 'nokogiri'
require 'byebug'
require 'open-uri'
require 'colorize'

require_relative 'post'
require_relative 'comment'

if ARGV.empty?
  puts "Must provide url"
  exit
else
  url = ARGV[0]
end

# # Geting the Post Data
page = Nokogiri::HTML(open(url)) # https://news.ycombinator.com/item?id=7663775
# #creating and parsing the post
post = Post.parse(page)
# #geting all comments from this actual post
puts "POST:  #{post.title.colorize(:yellow)} "
puts "last comment:"
puts post.comments.last

puts
# #byebug
# # add a coment as an object
#post.add_comments(Comment.new("Hello"))
