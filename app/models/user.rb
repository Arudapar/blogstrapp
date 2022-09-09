class User < ApplicationRecord
  rolify :role_cname => 'Roler'
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable,
         :validatable

         
  validate :password_complexity


  private

    def password_complexity
      return if password.nil?
  
      errors.add :password, :complexity unless CheckPasswordComplexityService.call(password)
    end
end
