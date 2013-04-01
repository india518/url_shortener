class CreateShortUrLs < ActiveRecord::Migration
  def up
    create_table :short_urls do |t|
      t.string :short_url_name
      t.timestamps
      t.integer :user_id
      t.integer :long_url_id
    end
  end

  def down
    drop_table :short_urls
  end
end
