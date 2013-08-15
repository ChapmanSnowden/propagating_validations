class Event < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  validates :organizer_name, presence: true
  validates :organizer_email, uniqueness: true, presence: true
end
