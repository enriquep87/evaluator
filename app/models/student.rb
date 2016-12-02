class Student < ApplicationRecord
  # Direct associations

  has_many   :class_members,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
