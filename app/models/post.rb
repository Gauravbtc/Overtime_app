class Post < ApplicationRecord
  enum status: {submitted: 0, approved: 1, rejected: 3 }
  belongs_to :user
  validates_presence_of :date, :rational, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0 }
end
