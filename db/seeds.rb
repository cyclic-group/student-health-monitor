# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.delete_all

User.create(id: 112358, password_hash: '$2a$12$pRQQQ8lTeyFx.Aa7Pxc.VuiCvDRqnaaF12FY00H2wnLFhrOT2UhBy', role: 'student')
Student.create(id: 112358, last_name: '高', first_name: '康平', dormitary: '润园6号公寓B座233')