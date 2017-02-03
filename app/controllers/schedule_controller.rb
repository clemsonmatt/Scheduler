class ScheduleController < ApplicationController
    def index
        @weekStart = Date.today.beginning_of_week
        @weekEnd   = @weekStart.advance(days: 5)

        @people = People.where(active: true)
    end
end
