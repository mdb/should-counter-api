class Should < ActiveRecord::Base
  validates :user, presence: true
  validates :context, presence: true
end
