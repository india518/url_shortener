#require 'launchy'
current_user = nil

puts "Enter your username!"
input = gets.chomp

  user = User.all.select {|x| x.username == input }.first
  if user.nil? #create a new user
    current_user = User.create(username: input.downcase)
    current_id = User.find(:all, :order => "id desc", :limit => 1).first.id
  else
    current_user = user
    current_id = user.id
  end

puts "Enter a URL!!"
url = gets.chomp

short_url = current_user.short_urls.select {|x| x.name == url }.first
short_url_id = nil
if short_url.nil?
  id = LongUrl.make_short_url(url, current_id)
  short_url_id = id # made make_short_url return id
else
  short_url_id = short_url.id
  url = ShortUrl.find(short_url_id).long_url.name
end
  #Launchy.open( url )
  #display comment(s), if they exist
  system('open', url)
  Stat.make_new_stat(short_url_id, current_id)
