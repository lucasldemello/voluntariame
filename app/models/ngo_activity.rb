class NgoActivity < ApplicationRecord
  belongs_to :ngo
  belongs_to :activity

  after_create :increment_activity_used_count
  before_destroy :decrement_activity_used_count

  private

  def increment_activity_used_count
    Activity.increment_counter(:used_count, activity_id)
  end

  def decrement_activity_used_count
    Activity.decrement_counter(:used_count, activity_id)
  end

end
