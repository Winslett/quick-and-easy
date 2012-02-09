class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String

  belongs_to :user
  belongs_to :messageable, polymorphic: true
end
