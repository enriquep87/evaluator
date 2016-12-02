class ClassMember < ApplicationRecord
  # Direct associations

  has_many   :class_comments,
             :dependent => :destroy

  belongs_to :class,
             :class_name => "Course"

  belongs_to :student

  # Indirect associations

  # Validations

end
