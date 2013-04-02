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
  system('open', url)
  Stat.make_new_stat(short_url_id, current_id)

#  Still working on this!
  #
  # if LongUrl.all.select {|x| x.name == url }.empty?
  #   #not a previous given long_url
  #
  #   if ShortUrl.all.select {|x| x.name == url }.empty?
  #     #not a previous given short_url
  #     #assume this is a long url we should shorten
  #     # and add to the database
  #     short_url = LongUrl.make_short_url(url)
  #
  #   else
  #     #this *is* a given short_url, so open it
  #     # and update it's stats
  #
  #   end
  # else
  #   #this is a previous given long url (just open it?)
  # end
