class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :ratings

  has_attached_file :profile_photo,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.Aws::s3_credentials }
                    :styles => {  :medium => "300x300>",
                                  :thumb => "100x100>" },
                                  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/
end
