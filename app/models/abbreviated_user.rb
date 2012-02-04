class AbbreviatedUser
  include Mongoid::Document
  embedded_in :creatable, polymorphic: true
end
