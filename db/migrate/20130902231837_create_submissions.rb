class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :player_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
