class CreateTokensTable < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token
      t.integer :player_id
    end

    add_index :tokens, :token
  end
end
