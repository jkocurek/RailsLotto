class CreateDraws < ActiveRecord::Migration[5.1]
  def change
    create_table :draws do |t|
      t.belongs_to :raffle, foreign_key: true
      t.belongs_to :ticket, foreign_key: true

      t.timestamps
    end
  end
end
