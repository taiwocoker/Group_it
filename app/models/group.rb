class Group < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :expense_groups
    has_many :expenses, through: :expense_groups


    validates :name, presence: true, length: { minimum: 3, maximum: 25 }


    scope :asc, -> { order('name ASC')}
end
