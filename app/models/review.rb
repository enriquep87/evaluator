class Review < ApplicationRecord
  # Direct associations

  belongs_to :class_comment
    

  belongs_to :class_member
    delegate :student, :to => :class_member, :allow_nil => true
    delegate :course, :to => :class_member, :allow_nil => true

  # Indirect associations

  # Validations
  validates(:class_member_id, {:presence=>true})
  validates(:class_comment_id, {:presence=>true})

end
