# == Schema Information
#
# Table name: draws
#
#  id         :integer          not null, primary key
#  raffle_id  :integer
#  ticket_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Draw < ApplicationRecord
  belongs_to :raffle
  belongs_to :ticket
end
