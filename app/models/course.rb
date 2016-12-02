class Course < ApplicationRecord
  # Direct associations

  has_many   :class_members,
             :foreign_key => "class_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
