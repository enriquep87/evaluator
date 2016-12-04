class Professor < ApplicationRecord
  # Direct associations

  has_many   :classes,
             :class_name => "Course",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations
  validates(:user_id, {:presence=>true})
  validates(:name, {:presence=>true})
  validates(:last_name, {:presence=>true})
end
