class ClassMember < ApplicationRecord
  # Direct associations

  has_many   :reviews,
  :dependent => :destroy

  has_many   :class_comments,
  :dependent => :destroy

  belongs_to :course

  belongs_to :student

  # Indirect associations

  # Validations
  validates(:student_id, {:presence=>true})
  validates(:course_id, {:presence=>true})
end
