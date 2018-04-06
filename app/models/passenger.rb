class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  def total_charges
    trips = self.trips

    return 0 if trips.length == 0

    charges_array = trips.map do |t|
      t.cost ? t.cost : 0
    end

    total_charges = sprintf("%.02f", charges_array.sum / 100.00)



    return total_charges
  end

  def deactivate_user
    trips = self.trips
    system_passenger = Passenger.where(name: "PREVIOUS USER").first

    if system_passenger == nil
      system_passenger = Passenger.create(name: "PREVIOUS USER")
    end

    trips.each do |t|
      t.passenger = system_passenger
      t.save
    end
  end

end
