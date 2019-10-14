100.times do |post|
  Post.create!(date: Date.today, rational: "#{post} rational content")
end
puts "100 post has been created"