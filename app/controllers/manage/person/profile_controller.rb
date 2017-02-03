class Manage::Person::ProfileController < ApplicationController
    def show
        @person = Person.find(params[:id])
    end

    def new
        @person = Person.new
    end

    def create
        @person = Person.new(person_params)

        @person.active = true

        if @person.save
            redirect_to manage_person_profile_path(@person.id)
        else
            render 'new'
        end
    end

    def edit
        @person = Person.find(params[:id])
    end

    def update
        @person = Person.find(params[:id])

        if @person.update(person_params)
            redirect_to manage_person_profile_path(@person.id)
        else
            render 'edit'
        end
    end

    private
        def person_params
            params.require(:person).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation, :gender, :dob, :address, :city, :state, :zip, :hire_date, :shirt_size, :active)
        end
end
