class ClassMember < ApplicationRecord
  # Direct associations

  belongs_to :class,
             :class_name => "Course"

  belongs_to :student

  # Indirect associations

  # Validations

end
