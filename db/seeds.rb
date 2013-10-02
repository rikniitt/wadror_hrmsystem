# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

matlu = Faculty.create :name => "Matemaattis-luonnontieteellinen tiedekunta"

cs = matlu.departments.create :name => "Tietojenkäsittelytieteen laitos"

bk127 = Room.create :name => "BK127", :description => "työ tila", :capacity => 10, :floor => 2
a111 = Room.create :name => "A111", :description => "luentosali", :capacity => 100, :floor => 1

tt = Employee.create :firstname => "Teemu", :lastname => "Testaaja", :telephone => "040123123"
mm = Employee.create :firstname => "Maija", :lastname => "Malli", :telephone => "050123123"

bk127.employees << tt
bk127.employees << mm
bk127.save

cs.employees << tt
cs.employees << mm
cs.save

group = ResearchGroup.create :name => "RAGE"
group.members << tt
group.save
