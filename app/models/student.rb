class Student < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :class_members,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
