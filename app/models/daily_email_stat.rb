class DailyEmailStat < ApplicationRecord
  validates :stat_date, presence: true, uniqueness: true
end
