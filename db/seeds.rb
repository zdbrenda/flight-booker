# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'open-uri'
require 'active_record/fixtures'

Airport.delete_all
open(File.join(File.dirname(__FILE__),"airports.dat.txt")) do |rows|
    rows.read.each_line do |row|
        
        num,name,city,country,code=row.chomp.split(",")
        puts name,code
        if code.length >= 3
            Airport.create!(:code => code)
            
        end
    end
end 

