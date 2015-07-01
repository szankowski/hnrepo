class Post
  attr_accessor :title, :url, :points, :item_id
  def initialize(title, url, points, item_id, all_comments = [])
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @all_comments = all_comments
    
  end
  # returns all the comments associated with a particular post
  def comments
    @all_comments
  end
  # takes a Comment object as its input and adds it to the comment list.

  def add_comments(comment)
    case comment
    when Comment then @all_comments << comment
    else
      @all_comments << Comment.new(comment.to_s)
    end
  end

  def to_s
    "Post: #{@item_id}: #{@title}"
  end

  def self.parse(page)
    page_title = page.css("title")[0].text   # => My webpage 
    page_url = page.search('.title > a').map { |link| link["href"] }[0]
    page_points = page.search('.score').map { |score| score.inner_text}[0]
    item_id = page.search('.score').map { |id| id["id"] }[0]

    comments = page.search('.comment > font:first-child')
                   .map { |font| Comment.new(font.inner_text) }

    Post.new(page_title, page_url, page_points, item_id, comments)
  end
end