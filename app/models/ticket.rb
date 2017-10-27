# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  raffle_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ticket < ApplicationRecord
  belongs_to :raffle
end
