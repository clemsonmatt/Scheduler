class Manage::PersonController < ApplicationController
    def index
        @people = Person.all
    end
end
