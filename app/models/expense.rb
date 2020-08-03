class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_groups
  has_many :groups, through: :expense_groups

  validates :name, presence: true, length: { minimum: 2, maximun: 25 }
  validates_numericality_of :amount, greater_than: 0, allow_nil: true

  scope :desc, -> { order('created_at DESC') }
end
