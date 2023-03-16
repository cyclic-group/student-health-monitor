class Student < ApplicationRecord

    belongs_to :user, foreign_key: "id"
    has_many :reports, foreign_key: "reporter_id"
    has_many :messages_sent, class_name: "Message", foreign_key: "sender_id"
    has_many :messages_received, class_name: "Message", foreign_key: "receiver_id"

    validates :last_name, presence: true
    validates :first_name, presence: true 

    # 返回所有未读消息
    def unread_messages
        self.messages_received.where(unread: true)
    end
end
