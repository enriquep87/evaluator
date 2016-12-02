class SessionComment < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  belongs_to :class_member,
             :class_name => "CourseMember",
             :foreign_key => "course_member_id"

  # Indirect associations

  # Validations

end
