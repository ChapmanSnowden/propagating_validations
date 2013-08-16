class Event < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  validates :organizer_name, presence: true
  validates :organizer_email, uniqueness: true, presence: true
  validate :verify_email_address
  validate :verify_date


  def verify_email_address
    self.organizer_email =~ (/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/) 
  end

  def verify_date
    if date.present? && date < Date.today
      errors.add(:date, "You sure about that date? It's already passed.")
    end
  end
end