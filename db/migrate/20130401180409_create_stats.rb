class CreateStats < ActiveRecord::Migration
  def up
    create_table :stats do |t|
      t.timestamps
      t.integer :user_id
    end
  end

  def down
    drop_table :stats
  end
end
