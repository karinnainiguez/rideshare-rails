class Trip < ApplicationRecord
  belongs_to :driver

  belongs_to :passenger

  validates :driver, presence: true

  def total_cost

    if self.cost
      return sprintf("%.02f", self.cost / 100.00)
    else
      return 0
    end


  end
end
