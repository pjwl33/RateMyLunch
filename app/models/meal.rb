class Meal < ActiveRecord::Base

	has_many :ratings
  belongs_to :goal

  has_attached_file :meal_photo,
                    :styles => {  :medium => "300x300>",
                                  :thumb => "100x100>" },
                                  :default_url => "https://http://s3.amazonaws.com/beattadashi/users/profile_photos/000/000/005"
  validates_attachment_content_type :meal_photo, :content_type => /\Aimage\/.*\Z/
  validates(:meal_photo, presence: true)
end
