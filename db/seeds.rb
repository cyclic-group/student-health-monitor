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

Message.delete_all
Announcement.delete_all 
message_1 = {unread: true, title: "医嘱1", content: "请每天保持足够的水分摄入量，并确保您喝足八杯水。", sender_id: 112358, receiver_id: 112358}
message_2 = {unread: false, title: "医嘱2", content: "您需要控制饮食，少食多餐，多吃蔬菜、水果和全谷类食品。", sender_id: 112358, receiver_id: 112358}
ann_1 = {title: "公告1", content: "所有学生必须遵守校规，包括行为规范和课堂纪律。任何违反规定的行为都将受到严厉处理。"}
ann_2 = {title: "公告2", content: "请所有教职员工和学生注意校园安全，避免发生任何意外事故。"}
Message.create!(message_1)
Announcement.create!(ann_1)
Announcement.create!(ann_2)
Message.create!(message_2)