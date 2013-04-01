class ChangeShortUrls < ActiveRecord::Migration
  def change
    remove_column :short_urls, :short_url_name
    add_column :short_urls, :name, :text
  end
end
