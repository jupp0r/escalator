class Issue < ActiveRecord::Base
  belongs_to :escalation_policy
  belongs_to :assignee, :class_name => "User"

  validates :escalation_policy_id, :presence => true
  validates :title, :presence => true
  validates :status, :presence => true
end
