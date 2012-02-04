class Creator
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String

  embedded_in :createable, polymorphic: true
  belongs_to :user
end
