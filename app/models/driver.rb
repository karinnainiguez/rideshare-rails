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

  end

  def last_trip

  end


end
