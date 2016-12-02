class Review < ApplicationRecord
  # Direct associations

  belongs_to :class_comment

  belongs_to :class_member

  # Indirect associations

  # Validations

end
