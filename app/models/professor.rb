class Professor < ApplicationRecord
  # Direct associations

  has_many   :classes,
             :class_name => "Course",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
