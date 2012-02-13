class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :message, type: String

  validates_presence_of :title, :message

  has_many :children, :class_name => "Post", :foreign_key => :parent_id
  accepts_nested_attributes_for :children

  belongs_to :parent, :class_name => "Post"
  belongs_to :top_parent, :class_name => "Post"

  embeds_one :creator, as: :createable

  before_save :set_top_parent

  def set_top_parent
    self.top_parent = find_top_parent
  end

  def find_top_parent
    if self.parent_id.nil?
      self
    elsif self.parent.top_parent
      self.parent.top_parent
    else
      self.parent.find_top_parent
    end
  end
end
