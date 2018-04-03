class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  FEE_PER_TRIP = 165
  REV_PERCENT = 0.80

  def total_earnings
    trips = Trip.all.select {|d| d.id == self.id}

    earnings_array = trips.map do |t|
      if t.cost < FEE_PER_TRIP
        0
      else
        t.cost - FEE_PER_TRIP
      end
    end

    earnings = (earnings_array.reduce) * REV_PERCENT

    return earnings
  end

  def average_rating
    trips = Trip.all.select {|d| d.id == self.id}

    return 0 if trips.length == 0

    total_ratings = 0

    trips.each do |t|
      total_ratings += t.rating
    end

    return (total_ratings/trips.length).to_f

  end

  def last_trip
    trips = Trip.all.select {|d| d.id == self.id}

    last_trip = trips.max_by do |t|
      t.date
    end

    return last_trip.date

  end


end
