class User < ApplicationRecord
    validate :check_empty_space
    validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ },
    length: {in: 3..15, :message => "Username should be 3-5 characters long", :allow_blank => true},
    presence: {:message => "Please choose a username.", on: :update},
    uniqueness: {:message => "Username already exists. Please select a different one."}

def check_empty_space
  if self.attribute.match(/\s+/)
    errors.add(:attribute, "No empty spaces please :(")
  end
end
end
