class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :list_id
end
