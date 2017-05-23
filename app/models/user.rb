class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_one :profile
    before_create :build_profile #creates profile at user registratio
  def full_name
    if self.name.blank?
      self.email
    else
      self.name
    end
  end
end
