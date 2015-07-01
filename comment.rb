class Comment
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def to_s
    "Comment: #{@text}".colorize(:light_blue ).colorize( :background => :yellow)
  end
end