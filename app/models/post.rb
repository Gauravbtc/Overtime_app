class Post < ApplicationRecord
  enum status: {submitted: 0, approved: 1, rejected: 3 }
  belongs_to :user
  validates_presence_of :date,:rational
end
