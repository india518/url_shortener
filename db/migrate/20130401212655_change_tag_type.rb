class ChangeTagType < ActiveRecord::Migration
  def change
    remove_column :tag_types, :type
    add_column :tag_types, :type_of_tag, :string
  end
end
