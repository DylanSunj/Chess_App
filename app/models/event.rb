# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  date        :datetime
#  description :text
#  location    :string
#  people      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Event < ApplicationRecord
  has_many  :attendees, class_name: "Attendee", foreign_key: "event", dependent: :nullify
  has_many :participants, through: :attendees, source: :attendee

  def start_time
    date
  end

end
