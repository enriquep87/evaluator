class ClassComment < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy


 has_many   :critiqs, :through => :reviews, :source => :class_member


  belongs_to :class_member

    delegate :student, :to => :class_member, :allow_nil => true
    delegate :course, :to => :class_member, :allow_nil => true

  def student_name
    return student.name

  end

  # Indirect associations

  # Validations

end
