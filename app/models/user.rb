class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :ratings
  has_many :meals

  has_attached_file :profile_photo,
                    :styles => {  :medium => "300x300>",
                                  :thumb => "100x100>" },
                                  :default_url => "https://s3.amazonaws.com/beattadashi/users/profile_photos/000/000/005/medium/placeholder.jpg"
  validates_attachment_content_type :profile_photo, :content_type => /\Aimage\/.*\Z/

  def meals_since_sunday
    tonight = DateTime.now.change(hour: 23, min: 59)
    last_sunday_night = tonight - tonight.wday
    meals = self.meals.order(created_at: :desc)
    meals.select { |m| m.created_at > last_sunday_night }
  end

end
