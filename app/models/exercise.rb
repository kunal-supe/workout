class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :duration_in_min, presence: true
  validates :duration_in_min, numericality: {only_integer: true}
  validates :workout, presence: true
  validates :workout_date, presence: true
  validates :user_id, presence: true
  validate :is_7_days_ago?

  default_scope {where('workout_date > ?', 7.days.ago).order(workout_date: :desc) }

  private
  def is_7_days_ago?
    if(workout_date < 7.days.ago)
      errors.add(:workout_date, "Date must not be 7 days ago")
    end
  end
end
