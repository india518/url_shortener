class ChangeTags < ActiveRecord::Migration
  def change
    remove_column :tags, :tag_name
    add_column :tags, :tag_type_id, :integer
  end
end
