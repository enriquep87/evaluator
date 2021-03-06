class Course < ApplicationRecord
  # Direct associations

  belongs_to :professor

  has_many   :class_members,
             :foreign_key => "course_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :students,
             :through => :class_members,
             :source => :student

  # Validations
  validates(:professor_id, {:presence=>true})
  validates(:name, {:presence=>true})
  validates(:quarter, {:presence=>true})
end
