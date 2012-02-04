class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :comment, type: String

  embeds_one :creator, as: :createable

  embeds_many :replies, as: :commentable
end
