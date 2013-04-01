class CreateTagTypes < ActiveRecord::Migration
  def up
    create_table :tag_types do |t|
      t.text :type
    end
  end

  def down
    drop_table :tag_types
  end
end
