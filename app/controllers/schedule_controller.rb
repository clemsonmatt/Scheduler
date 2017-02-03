class ScheduleController < ApplicationController
    def index
        @weekStart = Date.today.beginning_of_week
        @weekEnd   = @weekStart.advance(days: 5)

        @people = Person.where(active: true)
    end
end
