class Report < ApplicationRecord
    validates :reporter_id, presence: :true 
    validates :step_count, presence: :true 
    validates :step_count, comparison: { greater_than_or_equal_to: 0 }
    validates :sleep_hours, presence: :true 
    validates :sleep_hours, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }
    validates :symptons, presence: :true
    validates :responsed, inclusion: [true, false]
    
    belongs_to :reporter, class_name: 'Student' 

    SYMPTONS = ['发热', '呕吐', '腹泻', '咳嗽', '咽痛', '鼻塞', '流涕']

    def valid_symptons 
        self.symptons.filter { |s| SYMPTONS.include? s }
    end

    def problematic?
        (self.valid_symptons.size > 0 || !self.remark.blank?) && !self.responsed
    end

    def days_ago 
        ((Time.now - self.created_at) / (60 * 60 * 24)).floor 
    end

    def self.has_sympton sympton 
        Report.where(":sympton=ANY(symptons)", { sympton: sympton })
    end

    def self.within_one_month
        Report.where("created_at > :one_month_ago", { one_month_ago: 1.month.ago })
    end

    def self.within_one_week 
        Report.where("created_at > :one_week_ago", { one_week_ago: 4.day.ago })
    end
end
