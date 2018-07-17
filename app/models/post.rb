class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 150 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  def is_clickbait?
    bait = [/Won't Believe/, /Secret/, /Top/, /Guess/]
    bait.each do |b|
      if self.title.empty? && !self.title.match(b)
        errors.add(:title, "clickbait")
      else
        return true
      end
    end
  end

end
