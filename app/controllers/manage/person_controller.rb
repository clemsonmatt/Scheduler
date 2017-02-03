class Manage::PersonController < ApplicationController
    def index
        @people = People.all
    end
end
