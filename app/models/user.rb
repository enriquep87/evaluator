class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Direct associations

  has_one    :professor,
             :dependent => :destroy

  has_one    :student,
             :dependent => :destroy

  # Indirect associations

  # Validations
  validates(:username, :presence=>true, :uniqueness => true)
  validates(:role, :presence=>true)

end
