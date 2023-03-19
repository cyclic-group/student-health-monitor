class Message < ApplicationRecord

    belongs_to :sender, foreign_key: :sender_id, class_name: "User"
    belongs_to :receiver, foreign_key: :receiver_id, class_name: "Student"

    validates :title, presence: true 
    validates :content, presence: true 
    validates :sender_id, presence: true 
    validates :receiver_id, presence: true 
    validates :unread, inclusion: [true, false]

    # 检测是否为公告
    def announcement?
        self.receiver_id == User::BROADCAST_ID
    end

    # 返回所有公告（收件人为广播账号）
    def self.announcements 
        return Message.where(receiver_id: User::BROADCAST_ID)
    end
end
