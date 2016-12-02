class ClassComment < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  belongs_to :class_member

  # Indirect associations

  # Validations

end
