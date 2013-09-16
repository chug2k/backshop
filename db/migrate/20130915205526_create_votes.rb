class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :player_id
      t.integer :submission_id
      t.boolean :positive

      t.timestamps
    end
  end
end
