class ClassComment < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy


 has_many   :critiques, :through => :reviews, :source => :class_members


  belongs_to :class_member

  delegate :student, :to => :class_member, :allow_nil => true



  # Indirect associations

  # Validations

end
