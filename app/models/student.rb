class Student < ApplicationRecord

    belongs_to :user, foreign_key: "id"
    has_many :reports, foreign_key: "reporter_id"
    has_many :messages_received, class_name: "Message", foreign_key: "receiver_id"

    validates :last_name, presence: true
    validates :first_name, presence: true 

    # 返回所有未读消息
    def unread_messages
        self.messages_received.where(unread: true)
    end

    # 返回包含所有相关消息的数组
    def messages
        return self.messages_received.to_a + Message.announcements.to_a
    end 
end
