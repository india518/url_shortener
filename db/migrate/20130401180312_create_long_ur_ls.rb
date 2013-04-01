class CreateLongUrLs < ActiveRecord::Migration
  def up
    create_table :long_urls do |t|
      t.text :long_url_name
      t.timestamps
    end
  end

  def down
    drop_table :long_urls
  end
end
