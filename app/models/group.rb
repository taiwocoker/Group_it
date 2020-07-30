class Group < ApplicationRecord
    has_many :expense_groups
    has_many :expenses, through: :expense_groups


    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
end
