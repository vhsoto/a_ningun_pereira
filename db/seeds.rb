require 'faker'

	user = User.new(
    name: "admin", 
    email: "admin@example.com", 
    password: "holamundo"
  )
	user.skip_confirmation!
	user.save
  user.role = 'admin'
  user.save

  #Crear moderador
   moderador = User.new(
   name:     'Moderador',
   email:    'moderador@example.com', 
   password: 'holamundo'
  )
   moderador.skip_confirmation!
   moderador.save!
   moderador.role = 'moderador'
   moderador.save
 
   # Create a member
   member = User.new(
     name:     'Member',
     email:    'member@example.com',
     password: 'holamundo',
   )
   member.skip_confirmation!
   member.save!

	6.times do 
		#Create User
		fake_user = User.new(
			  name:  Faker::Name.name ,       
			  email: Faker::Internet.email ,
				password: Faker::Lorem.characters(10)
			)
		fake_user.skip_confirmation!
	  fake_user.save!
	end
	users = User.all
 # Create Complaints
 20.times do
   Complaint.create!(
   	user: users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 complaints = Complaint.all
 
 # Create Comments
 10.times do
   Comment.create!(
   	user: users.sample,
     complaint: complaints.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Complaint.count} complaints created"
 puts "#{Comment.count} comments created"
 puts "#{User.count} users created"