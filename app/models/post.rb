class Post < ApplicationRecord
    #basic Post validations
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

    #custom post validations
    validate :title_is_clickbaity

    CLICKBAITY = [
        /Won't Believe/i,
        /Secret/i,
        /Top/i,
        /Guess/i
      ]
  
    def title_is_clickbaity
        if CLICKBAITY.none? {|clickbaity| clickbaity.match title }
        errors.add(:title, "must be clickbait")
      end
    end
end
