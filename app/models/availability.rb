class Availability
    include Mongoid::Document

    field :day, type: String
    field :start_time, type: String
    field :end_time, type: String
    field :all_day, type: Boolean

    belongs_to :person, class_name: "Person", polymorphic: true

    validates :day, presence: true
    validates :start_time, presence: true, unless: :all_day
    validates :end_time, presence: true, unless: :all_day
    validates :person, presence: true
end
