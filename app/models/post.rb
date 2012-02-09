class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String

  validates_presence_of :title

  has_one :message, as: :messageable
  accepts_nested_attributes_for :message

  embeds_many :comments, as: :commentable
  accepts_nested_attributes_for :comments

  embeds_one :creator, as: :createable
end
