class User < ApplicationRecord
    has_many :expenses,foreign_key: :author_id, dependent: :destroy
    has_many :groups, foreign_key: :author_id
    has_one_attached :image
    
    validates :username, presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 25 }
end
