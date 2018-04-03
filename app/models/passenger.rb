class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  def total_charges
    trips = Trip.all.select { |t| t.passenger_id == self.id }

    charges_array = trips.map do |t|
      t.cost
    end

    total_charges = charges_array.sum

    return total_charges
  end
end
