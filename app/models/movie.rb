class Movie < ActiveRecord::Base

  has_many :reviews

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

  validates :poster_image_url,
    presence: true, unless: ->(movie){ movie.image.present? }

  validates :image,
    presence: true, unless: ->(movie){ movie.poster_image_url.present? }

  validate :release_date_is_in_the_past


  def review_average
    if reviews.size > 0
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end

  mount_uploader :image, ImageUploader # mount_uploader = method; :image = column name in movies table; ImageUploader = image_uploader.rb in app/uploaders

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end