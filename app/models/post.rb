class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String

  has_one :message, autosave: true
  accepts_nested_attributes_for :message

  embeds_one :creator, as: :createable
end
