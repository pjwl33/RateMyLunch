class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :ratings

  has_attached_file :profile_photo,
                    :styles => {  :medium => "300x300>",
                                  :thumb => "100x100>" },
                                  :default_url => "https://http://s3.amazonaws.com/beattadashi/users/profile_photos/000/000/005"
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
end
