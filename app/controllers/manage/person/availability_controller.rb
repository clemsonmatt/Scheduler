class Manage::Person::AvailabilityController < ApplicationController
    def show
        @person       = Person.find(params[:id])
        @availability = Availability.new
    end

    def create
        @person = Person.find(params[:id])

        @availability         = Availability.new
        @availability.day     = availability_params['day']
        @availability.all_day = availability_params['all_day']
        @availability.person  = @person

        # format time as a string
        if ! @availability.all_day
            start_time_hrs = (availability_params['start_time(4i)']).to_s
            start_time_mns = (availability_params['start_time(5i)']).to_s
            end_time_hrs   = (availability_params['end_time(4i)']).to_s
            end_time_mns   = (availability_params['end_time(5i)']).to_s

            @availability.start_time = start_time_hrs + ':' + start_time_mns + ':00'
            @availability.end_time   = end_time_hrs + ':' + end_time_mns + ':00'
        end

        if @availability.save
            flash[:success] = 'Availability saved'
            redirect_to manage_person_availability_path(@person)
        else
            flash[:warning] = 'Missing fields'
            redirect_to manage_person_availability_path(@person)
        end
    end

    def destroy
        person       = Person.find(params[:id])
        availability = Availability.find(params[:availability_id])

        availability.destroy

        flash[:warning] = 'Availability removed'
        redirect_to manage_person_availability_path(person.id)
    end

    private
        def availability_params
            params.require(:availability).permit(:day, :start_time, :end_time, :all_day, :notes)
        end
end
