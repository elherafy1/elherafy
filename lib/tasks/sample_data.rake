namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    review= Review.create({:price => 4, :clean => 3, :quilty => 2, :disicpline => 1, :treatment => 3})
    admin =  Worker.new(name: "",
                    area: "",
                    status: "",
                    phone: "",
                    kind: "")
    admin.reviews<<review
    admin.save
    
      50.times do |n|
        #review= Review.create(4,3,2,1,3)
        name = Faker::Name.name
        area = ['',''].sample
        status = ['',''].sample
        phone = Faker::PhoneNumber.phone_number
        kind = ['', '', ''].sample
          admin.reviews<<review
          admin.save
        review= Review.create({:price => 4, :clean => 3, :quilty => 2, :disicpline => 1, :treatment => 3})
        worker=Worker.new(name: name, area: area, status: status, phone: phone, kind: kind)
        worker.reviews<<review
        worker.save
      end
        workers = Worker.all#limit(6)


        10.times do
          workers.each { |worker| worker.reviews.create!({:price => (1..5).to_a.sample, :clean => (1..5).to_a.sample, :quilty => (1..5).to_a.sample, :disicpline => (1..5).to_a.sample, :treatment => (1..5).to_a.sample}) }
        end


  end
end