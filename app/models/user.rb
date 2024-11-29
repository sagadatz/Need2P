class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Set username as the unique login attribute
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  # Override Devise's find_for_database_authentication to search by username
  def self.find_for_database_authentication(conditions)
    conditions[:username] = conditions.delete(:email)  # Change :email to :username
    super(conditions)
  end
end
