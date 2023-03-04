class Person < ApplicationRecord
    include BCrypt 

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
