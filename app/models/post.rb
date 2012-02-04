class Post
  include Mongoid::Document

  field :title, :type => String

  has_one :message, autosave: true
  accepts_nested_attributes_for :message

  embeds_one :creator, as: :createable
end
