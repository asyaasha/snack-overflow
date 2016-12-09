class Question < ApplicationRecord
  validates :title, :text,  :presence => true

  belongs_to :user
  has_many :answers, dependent: :destroy

  def time_since_creation
    time_since = ((Time.now - created_at)/60).round
    if time_since >= 60
      time_since / 60
      return "#{time_since} hours ago"
    end
    "#{time_since} minutes ago"
  end
end
