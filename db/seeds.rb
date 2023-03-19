# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'bcrypt'

def generate_announcement(content)
    Message.create!(content: content, title: "公告X", sender_id: 0, receiver_id: User::BROADCAST_ID)
end 

def generate_msg(content)
    Message.create!(content: content, title: "医嘱Y", sender_id: 1, receiver_id: 112358)
end

# 50% returns 0, 50% returns 1
def flip_coin 
    (Random.random_number * 2).floor 
end

# Insert users
User.delete_all
User.create!(id: User::BROADCAST_ID, password_hash: BCrypt::Password.create('2357bd'), role: 'student')
Student.create!(id: User::BROADCAST_ID, last_name: '--', first_name: '--', dormitary: '--')
User.create!(id: 0, password_hash: BCrypt::Password.create('2357db'), role: 'admin')
User.create!(id: 1, password_hash: BCrypt::Password.create('2357db'), role: 'doctor')
User.create!(id: 112358, password_hash: BCrypt::Password.create('gkp233'), role: 'student')
Student.create!(id: 112358, last_name: '高', first_name: '康平', dormitary: '润园6号公寓B座233')

# Insert messages
Message.delete_all

ann_contents = ["所有学生必须遵守校规，包括行为规范和课堂纪律。任何违反规定的行为都将受到严厉处理。\n\n校务处",
    "请所有教职员工和学生注意校园安全，避免发生任何意外事故。\n\n校务处",
    "所有学生必须按时到校上课，并遵守上课时间安排。迟到或早退的行为将被记录在档案中。\n\n校务处",
    "请学生和家长积极配合学校的教育教学工作，支持学校的各项活动和课程安排。\n\n校务处",
    "学校将加强学生的心理健康教育，如有需要，请及时向学校心理咨询师寻求帮助。\n\n校务处",
    "所有学生必须爱护校园环境，不得随意破坏或污染学校环境。\n\n校务处",
    "请所有学生和家长积极配合学校的疫情防控工作，做好个人卫生和防护措施。\n\n校务处",
    "学校将加强对学生的学习辅导和课外活动，鼓励学生参加各种文体活动，促进学生的全面发展。\n\n校务处",
    "所有学生必须遵守考试规定，不得作弊或抄袭。如有发现，将按照学校规定进行处理。\n\n校务处",
    "学校将定期开展家长会、教师家访等活动，加强家校沟通，促进学校教育教学质量的提高。\n\n校务处"]

msg_contents = ["请每天保持足够的水分摄入量，并确保您喝足八杯水。\n\n校医工作室",
    "您需要控制饮食，少食多餐，多吃蔬菜、水果和全谷类食品。\n\n校医工作室",
    "请按照您的医生给出的药品处方用药，并确保按照规定时间和剂量服用。\n\n校医工作室",
    "如果您感到头晕、乏力或出现其他异常症状，请立即停止用药并联系您的医生。\n\n校医工作室",
    "请保持充足的休息时间，每天睡眠7-8小时，避免熬夜。\n\n校医工作室",
    "避免长时间的坐着或站立，每隔一段时间就起身活动一下，促进血液循环。\n\n校医工作室",
    "请避免吸烟、饮酒或使用其他药物，这些会对您的健康产生负面影响。\n\n校医工作室",
    "如您在用药期间出现不良反应或过敏症状，请立即联系您的医生并停止用药。\n\n校医工作室",
    "请避免紧张、焦虑和压力，保持心情舒畅，积极参加体育运动和其他娱乐活动。\n\n校医工作室",
    "请遵循医生的建议进行常规体检和筛查，以确保您的健康状况得到及时检测和治疗。\n\n校医工作室"]

# mix ann and msg in terms of generation order 
i = 0
j = 0
while true 
    if flip_coin == 0
        generate_announcement(ann_contents[i])
        i += 1
    else 
        generate_msg(msg_contents[j])
        j += 1
    end

    # if one list is finished, work on the other entirely
    if i == ann_contents.size
        while j < msg_contents.size
            generate_msg(msg_contents[j]) 
            j += 1
        end
        break 
    end

    if j == msg_contents.size 
        while i < ann_contents.size 
            generate_announcement(ann_contents[i]) 
            i += 1
        end
        break 
    end 
end
