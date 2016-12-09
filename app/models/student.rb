class Student < ApplicationRecord
  # Direct associations
  validates(:user_id, {:presence=>true})
  belongs_to :user

  has_many   :class_members,
             :dependent => :destroy

  # Indirect associations

  has_many   :classes,
             :through => :class_members,
             :source => :course

  has_many :comments_inclass,
           :through => :class_members,
           :source => :class_comment

 


  # Validations
  validates(:name, {:presence=>true})
  validates(:last_name, {:presence=>true})
  validates(:mba_class, {:presence=>true})
  validates(:user_id, {:presence=>true})
end
