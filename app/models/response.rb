class Response < ActiveRecord::Base
  validates :email, :body, presence: true
end
