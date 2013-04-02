#require 'launchy'
require 'debugger'
current_user = nil

puts "Are you a new or existing user? Type 0 for new, 1 for existing."
input = gets.chomp.to_i
if input == 0
  begin
    puts "What do you want for a username?"
    username = gets.chomp
    puts "What email do you want to use?"
    email = gets.chomp
    current_user = User.new(username: username, email: email)
    current_user.save!
  rescue ActiveRecord::RecordInvalid
    puts current_user.errors.full_messages
    retry
  end
  current_id = User.find(:all, :order => "id desc", :limit => 1).first.id

else
  puts "Enter your username!"
  input = gets.chomp

  user = User.all.select {|x| x.username == input }.first
  if user.nil? #create a new user
    # use validation to tell them this screen name doesn't exist
  else
    current_user = user
    current_id = user.id
  end
end

url = nil
potential_long_url = nil
loop do
  puts "Enter a URL!!"
  url = gets.chomp
  potential_long_url = LongUrl.new(name: url)
  break if potential_long_url.valid?
  puts potential_long_url.errors.full_messages
end

short_url = current_user.short_urls.select {|x| x.name == url }.first
short_url_id = nil
if short_url.nil?
  potential_long_url.save!
  #debugger
  begin
    #new_short_url = LongUrl.make_short_url(url, current_id)
    new_short_url = ShortUrl.new({name: SecureRandom.urlsafe_base64(5),
      user_id: current_id, long_url_id: potential_long_url.id})
    new_short_url.save!
    new_short_id = new_short_url.id
  rescue
    puts new_short_url.errors.full_messages
    puts "Waiting 60 seconds before trying again. Please hold..."
    sleep(60)
    retry
  end

else
  short_url_id = short_url.id
  short_url.display_comments
  url = ShortUrl.find(short_url_id).long_url.name
end
  #Launchy.open( url )
  #display comment(s), if they exist
  system('open', url)
  Stat.make_new_stat(short_url_id, current_id)
