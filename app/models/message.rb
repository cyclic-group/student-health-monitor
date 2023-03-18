class Message < ApplicationRecord

    belongs_to :sender, foreign_key: :sender_id, class_name: "User"
    belongs_to :receiver, foreign_key: :receiver_id, class_name: "Student"

    validates :title, presence: true 
    validates :content, presence: true 
    validates :sender_id, presence: true 
    validates :receiver_id, presence: true 
    validates :unread, inclusion: [true, false]
end
