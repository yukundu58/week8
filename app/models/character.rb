class Character < ApplicationRecord

  belongs_to :actor   # define a method
  belongs_to :movie   # define a method
  # belongs_to :other_actor, class_name: 'Actor', foreign_key: 'other_actor_id'

end
