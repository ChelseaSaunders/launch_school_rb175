users = { :jamy=>{:email=>"jamy.rustenburg@gmail.com", :interests=>["woodworking", "cooking", "reading"]}, 
          :nora=>{:email=>"nora.alnes@yahoo.com", :interests=>["cycling", "basketball", "economics"]}, 
          :hiroko=>{:email=>"hiroko.ohara@hotmail.com", :interests=>["politics", "history", "birding"]} }

def count_interests(user)
  interests = []
  user.each_value {|user| interests << user[:interests] }
  interests.flatten.uniq.count
end

p count_interests(users)