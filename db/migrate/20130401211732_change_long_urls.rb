class ChangeLongUrls < ActiveRecord::Migration
  def change
    remove_column :long_urls, :long_url_name
    add_column :long_urls, :name, :text
  end
end
