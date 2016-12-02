class CourseMember < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_many   :class_comments,
             :class_name => "SessionComment",
             :dependent => :destroy

  belongs_to :class,
             :class_name => "Course",
             :foreign_key => "course_id"

  belongs_to :student

  # Indirect associations

  # Validations

end
