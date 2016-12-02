class User < ApplicationRecord
  # Direct associations

  has_one    :professor,
             :dependent => :destroy

  has_one    :student,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
