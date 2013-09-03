class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :player_id
      t.string :topic_id

      t.timestamps
    end
  end
end
