class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :test
  has_one :user
  has_many :answers

  def test
    "blablabla"
  end


end
