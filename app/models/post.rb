class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 150 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

#add a custom validator to Post that ensures the title is sufficiently clickbait-y
  def is_clickbait?
    bait = [/Won't Believe/i, /Secret/i, /Top/i, /Guess/i]
    bait.each do |b|
      if self.title.nil? || !self.title.match(b)
        errors.add(:title, "clickbait")
      else
        return true
      end
    end
  end

end
