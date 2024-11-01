class User < ApplicationRecord
  has_secure_password

  has_many :articles, dependent: :destroy
  before_save {self.email = email.downcase}

  validates :username, presence: true, length: {minimum:3, maximum:35}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:105},
                    uniqueness: {case_sensitive: false},
                    format: {with: VALID_EMAIL_REGEX}

end
