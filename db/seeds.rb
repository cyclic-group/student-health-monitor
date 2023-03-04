# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Person.delete_all 
Person.create(id: 112358, password_hash: '$2a$12$pRQQQ8lTeyFx.Aa7Pxc.VuiCvDRqnaaF12FY00H2wnLFhrOT2UhBy', 
    last_name: '高', first_name: '康平', dormitary: nil, role: 'student')