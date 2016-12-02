class Course < ApplicationRecord
  # Direct associations

  belongs_to :professor

  has_many   :class_members,
             :foreign_key => "class_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
