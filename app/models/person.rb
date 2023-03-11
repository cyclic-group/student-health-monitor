class Person < ApplicationRecord
    include BCrypt 

    has_many :reports, foreign_key: 'reporter_id'

    validates :password_hash, presence: true 
    validates :role, presence: true 
    validates :role, inclusion: { in: ['admin', 'doctor', 'student'] }
    validates :last_name, presence: true
    validates :first_name, presence: true 

    # def password
    #     Password.new(self.password_hash)
    # end

    # def password=(new_password)
    #     self.password_hash = Password.create(new_password)
    # end

    def authenticate(password)
        return Password.new(self.password_hash) == password
    end
end
