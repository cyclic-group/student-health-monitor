class Report < ApplicationRecord
    validates :reporter_id, presence: :true 
    validates :step_count, presence: :true 
    validates :step_count, comparison: { greater_than_or_equal_to: 0 }
    validates :sleep_hours, presence: :true 
    validates :sleep_hours, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }
    validates :symptons, presence: :true 
    
    belongs_to :reporter, class_name: 'Student' 
end
