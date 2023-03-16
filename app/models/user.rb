require 'bcrypt'

class User < ApplicationRecord
    include BCrypt  # 采用bcrypt散列值算法存储密码

    has_many :reports, foreign_key: 'reporter_id'

    validates :password_hash, presence: true  
    validates :role, presence: true, inclusion: { in: ['admin', 'doctor', 'student'] }

    # 验证密码，返回`true`当且仅当密码正确
    def authenticate(input_password)
        return Password.new(self.password_hash) == input_password
    end

    # 设置密码
    def password=(new_password)
        self.password_hash = Password.create(new_password)
    end

    def student?
        self.role == 'student'
    end
    
    def admin?
        self.role == 'admin'
    end

    def doctor?
        self.role == 'doctor'
    end 
end
