desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  usernames = ["alice", "bob", "carol", "dave", "eve"]

  usernames.each do |username|
    
    user = User.new 
    user.email = "#{username}@example.com"
    user.password = "password"
    user.save 
    
  end 
end
