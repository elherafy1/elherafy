#encoding: UTF-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    admin = Admin.create!(email: "admin@example.org",
                         password: "password",
                         password_confirmation: "password")

    job1 = Job.create(name: "مبلط",
          picture: "http://surreytiler.co.uk/wp-content/uploads/2013/02/surreytiler.jpg")
    job2 = Job.create(name: "نجار",
          picture: "http://www.courtyardboulder.com/wp-content/uploads/2013/05/General-Carpentry-Knowledge.jpg")
    job3 = Job.create(name: "سباك",
          picture: "http://www.kakaboyplumbers.co.za/images/plumbing_tool.jpg")
    job4 = Job.create(name: "كهربائي",
          picture: "http://www.firstaidlearn.com/images/Electric-shocks33.jpg")


    Job.all.each do |l|

      10.times do |n|
        #review= Review.create(4,3,2,1,3)
        name = Faker::Name.name
        area = ['القاهرة','الجيزة'].sample
        status = ['متاح','مشغول'].sample
        phone = Faker::PhoneNumber.phone_number
        email = "example-#{n+1}@example.com"
        addres = Faker::Lorem.sentence(5)
        comment = Faker::Lorem.sentence(5)
        job_id = l.id
        review= Review.create({:price => 4, :clean => 3, :quilty => 2, :disicpline => 1, :treatment => 3, client_name: name , client_phone: phone , client_email: email , client_addres: addres, comment:comment})
        worker=Worker.new({name: name, area: area, status: status, phone: phone, job_id: l.id})
        worker.reviews<<review
        worker.save
      end
    end
        workers = Worker.all#limit(6)



        10.times do
          workers.each { |worker| worker.reviews.create!({:price => (1..5).to_a.sample, :clean => (1..5).to_a.sample, :quilty => (1..5).to_a.sample, :disicpline => (1..5).to_a.sample, :treatment => (1..5).to_a.sample,
            client_name: name , client_phone: phone , client_email: email , client_addres: addres, comment:comment}) }
        end


  end
end