class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String

  has_one :message, as: :messageable
  accepts_nested_attributes_for :message

  embeds_one :creator, as: :createable

  embeds_many :replies, as: :commentable
end
