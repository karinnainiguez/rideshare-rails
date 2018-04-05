class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  FEE_PER_TRIP = 165
  REV_PERCENT = 0.80

  def total_earnings
    trips = self.trips

    return 0 if trips.length == 0

    earnings_array = trips.map do |t|
      if t.cost == nil || t.cost < FEE_PER_TRIP
        0
      else
        t.cost - FEE_PER_TRIP
      end
    end

    earnings = (earnings_array.sum) * REV_PERCENT

    return (earnings/100.00).round(2)
  end

  def average_rating
    trips = self.trips

    return 0 if trips.length == 0

    total_ratings = 0
    rated_trips = 0

    trips.each do |t|
      if t.rating
        total_ratings += t.rating
        rated_trips += 1
      end
    end

    return (total_ratings/rated_trips).to_f

  end

  def last_trip
    trips = self.trips

    return trips.order(:date).first
  end

  def deactivate_user
    trips = self.trips
    system_driver = Driver.where(name: "PREVIOUS USER").first

    if system_driver == nil
      system_driver = Driver.create(name: "PREVIOUS USER")
    end

    trips.each do |t|
      t.driver = system_driver
      t.save
    end
  end

  def self.next_driver
    drivers = self.all
    trip_array = drivers.map {|d| d.last_trip}
    oldest_trip = trip_array.compact.max_by {|t| (Date.today - t.date).to_i }

    return oldest_trip.driver
  end



end
