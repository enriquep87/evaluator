class Review < ApplicationRecord
  # Direct associations

  belongs_to :class_comment,
             :class_name => "SessionComment",
             :foreign_key => "session_comment_id"

  belongs_to :class_member,
             :class_name => "CourseMember",
             :foreign_key => "course_member_id"

  # Indirect associations

  # Validations

end
