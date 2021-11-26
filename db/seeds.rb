# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'active_record/fixtures'

Airport.delete_all
count = 0
open(File.join(File.dirname(__FILE__),"airports.dat.txt")) do |rows|
    rows.read.each_line do |row|
        
        num,name,city,country,code=row.chomp.split(",")
        puts name,code
        if code.length >= 5
            code=code[1..-2]
            Airport.create!(:code => code)
            count += 1
            if count == 100
                break
            end
        end
    end
end

Flight.delete_all
5000.times do |index|
    Flight.create!(
        dep_airport_id: rand(1..100),
        arr_airport_id: rand(1..100),
        start_datetime: Faker::Time.forward(days:100),
        duration: rand(60..600)
    )
end

