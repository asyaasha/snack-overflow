class Comment < ApplicationRecord
  validates_presence_of :text

  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
