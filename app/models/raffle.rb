# == Schema Information
#
# Table name: raffles
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Raffle < ApplicationRecord
  has_many :tickets
  has_many :draws
  @used_tickets = Hash.new
  
  def self.create_with_tickets(count = 100)
    Raffle.create.tap do |raffle|
      count.times { Ticket.create(raffle: raffle) }
    end
	@total_tickets = Raffle.count	#total number of tickets
	@random_draw = Random.new		#initialize psuedorandom number generator
	@drawn_ticket = @random_draw.rand(1..@total_tickets)	#generate a random number for ticket
	@used_tickets(@drawn_ticket} = 1#add to hash
  end

  def draw
	while @used_tickets{@drawn_ticket} != nil (
		@drawn_ticket = @random_draw.rand(1..@total_tickets)
	}
	@used_tickets(@drawn_ticket} = 1
	winning_ticket = Raffle.find(@drawn_ticket)
  end
  
end
