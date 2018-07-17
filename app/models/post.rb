class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 150 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

#add a custom validator to Post that ensures the title is sufficiently clickbait-y
  def is_clickbait?
    bait = [/Won't Believe/, /Secret/, /Top/, /Guess/]
    bait.each do |b|
      if self.title.match(b) || self.title.nil?
        errors.add(:title, "clickbait-y")
      else
        return true
      end
    end
  end

end
