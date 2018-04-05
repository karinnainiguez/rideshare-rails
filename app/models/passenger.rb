class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  def total_charges
    trips = self.trips

    return 0 if trips.length == 0

    charges_array = trips.map do |t|
      t.cost ? t.cost : 0
    end

    total_charges = charges_array.sum

    return total_charges
  end
end
