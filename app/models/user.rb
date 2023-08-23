# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true
    validate :ensure_session_token


    def password=(password)
        self.password_digest = Bcrypt::Password.create(password)
    end

    def is_password?(password)
        password_object = Bcrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

    private

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64(16)
    end

end
