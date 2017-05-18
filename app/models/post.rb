class Post < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "800x800>", thumb: "100x100>" }, default_url: "/images/normal/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, :presence => true, :length => { :minimum => 5}
  validates :description, :presence => true
  belongs_to :user
  has_many :comments
  
end