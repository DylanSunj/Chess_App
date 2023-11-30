# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  event      :integer
#  user       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Attendee < ApplicationRecord
  belongs_to :occurance, required: true, class_name: "Event", foreign_key: "event"
  belongs_to :attendee, required: true, class_name: "User", foreign_key: "user"
end
