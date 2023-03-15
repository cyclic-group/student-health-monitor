class Student < ApplicationRecord

    belongs_to :users, foreign_key: "id"

    validates last_name, presence: true
    validates first_name, presence: true 
end
