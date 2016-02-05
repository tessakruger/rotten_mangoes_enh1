class Movie < ActiveRecord::Base

  has_many :reviews
  belongs_to :user

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  validates_presence_of :poster_image_url,
    allow_nil: true

  validate :release_date_is_in_the_past

  validate :image_size_validation

  validate :image_xor_poster_url

  mount_uploader :image, ImageUploader # mount_uploader = method; :image = column name in movies table; ImageUploader = image_uploader.rb in app/uploaders

  def review_average
    if reviews.size > 0
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

  def image_size_validation
    errors[:image] << "should be less than 500kb" if image.size > 0.5.megabytes
  end

  def image_xor_poster_url
    unless image.blank? ^ poster_image_url.blank?
      errors.add(:base, "Upload an image or enter an image URL, not both")
    end
  end

end