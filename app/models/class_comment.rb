class ClassComment < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy


  belongs_to :class_member

  delegate :student, :to => :class_member, :allow_nil => true



  # Indirect associations

  # Validations

end
