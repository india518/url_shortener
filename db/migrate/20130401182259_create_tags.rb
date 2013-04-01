class CreateTags < ActiveRecord::Migration
  def up
    create_table :tags do |t|
      t.timestamps
      t.integer :short_url_id
      t.integer :user_id
      t.string :tag_name
    end
  end

  def down
    drop_table :tags
  end
end
