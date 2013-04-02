current_user = nil


puts "Enter your username!"
input = gets.chomp


  user = User.all.select {|x| x.username == input }.first
  if user.nil?
    #create a new user
    current_user = User.new(username: input.downcase)
  else
    current_user = user
  end



puts "Enter a URL!!"
url = gets.chomp
if LongUrl.all.select {|x| x.name == url }.empty?

  if ShortUrl.all.select {|x| x.name == url }.empty?
  end
end
short_url = LongUrl.make_short_url(url)
