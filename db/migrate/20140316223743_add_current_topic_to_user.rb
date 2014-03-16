class AddCurrentTopicToUser < ActiveRecord::Migration
  def change
    add_column :players, 'current_topic_id', :integer
    add_column :players, 'current_topic_updated_at', :datetime
  end
end
