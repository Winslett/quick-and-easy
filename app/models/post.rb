class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :message, type: String

  validates_presence_of :title, :message

  belongs_to :parent, class_name: "Post"

  has_many :children, class_name: "Post"
  accepts_nested_attributes_for :children

  embeds_one :creator, as: :createable
end
