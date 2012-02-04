class Creator
  include Mongoid::Document

  field :name, type: String
  field :email, type: String

  embedded_in :createable, polymorphic: true
  belongs_to :user
end
