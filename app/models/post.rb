class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 150 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  # def is_clickbait?
  #   clickbait = [/Won't Believe/, /Secret/, /Top/, /Guess/]
  #   if clickbait.empty? { |}
  # end

end
