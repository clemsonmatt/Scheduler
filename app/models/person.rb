class Person
    include Mongoid::Document
    include ActiveModel::SecurePassword

    def to_s
        "#{self.first_name} #{self.last_name}"
    end

    # personal
    field :first_name, type: String
    field :last_name, type: String
    field :email, type: String
    field :phone, type: String
    field :password_digest, type: String
    field :gender, type: String
    field :dob, type: Date
    field :address, type: String
    field :city, type: String
    field :state, type: String
    field :zip, type: Integer

    # company
    field :active, type: Boolean
    field :hire_date, type: Date
    field :shirt_size, type: String

    has_many :availability, dependent: :delete

    has_secure_password
end
