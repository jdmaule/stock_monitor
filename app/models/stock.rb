class Stock < ApplicationRecord
  # Direct associations

  has_many   :follows,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
