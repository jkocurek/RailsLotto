# == Schema Information
#
# Table name: raffles
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Raffle, type: :model do
  describe '::create_with_tickets' do
    it 'is successfully created with tickets' do
      raffle = Raffle.create_with_tickets(10)
      expect(raffle).to be_persisted
      expect(raffle.tickets.count).to eq(10)
    end
  end

  describe '#draw' do
    it 'can draw a winner'
    it 'will not draw the same winner twice'
    it 'can draw a winner from a large table' do
      pending '#draw is not implemented'
      raffle = Raffle.create
      stamp = Time.now.to_s(:db)
      vals = ["#{raffle.id}, '#{stamp}', '#{stamp}'"] * 1_000_000
      sql = <<~SQL
        INSERT INTO `tickets` (`raffle_id`,`created_at`,`updated_at`) VALUES (#{vals.join('),(')})
      SQL
      ActiveRecord::Base.connection.execute(sql)
      start_time = Time.now
      ticket = raffle.draw
      duration = Time.now - start_time
      expect(ticket).not_to be_nil
      expect(duration).to be < 0.3
    end
  end
end
