class Rental < ApplicationRecord

  validates :car_id , :presence  => true
  validates :customer_id , :presence =>true
  validates :start_date, :presence =>true
  validates :end_date, :presence =>true
  #validate :valid_customer_email

  def book
    self.update_attributes( :status => "booked")
    self.get_car.reserved
  end

  def self.Not_Checked_out (id)

  end
  def start
    self.status = "checked_out"
    self.start_date = Time.zone.now.to_datetime
    self.get_car.checkout
    self.save
  end

  def cancel
    if ((self.status != "finished") && (self.status != "checked_out"))
      self.update_attributes( :status => "cancelled")
      self.status = "cancelled"
      self.save!
      self.get_car.available
    end

  end

  def finish
    if ( (self.status == "checked_out"))
      self.status = "finished"
      self.end_date = Time.zone.now.to_datetime
      self.get_car.available
      self.get_customer.rental_charge = "52"
      self.get_customer.save!
      self.save!
    end

  end

def get_car
  return Car.find(self.car_id)
end

  def get_customer
    return Customer.find(self.customer_id)
  end
  def open_rental
    if (Rental.find_by_customer_id_and_status(self.customer_id, "booked"))
      return true
    elsif (Rental.find_by_customer_id_and_status(self.customer_id, "checked_out"))
      return true
    end
    return false
  end

  def validates_start_date
    if (self.start_date < Time.zone.now.to_datetime)
      errors.add(:start_date, "cannot book in past")
    end
  end

  def validates_end_date
    if ((self.end_date - self.start_date)/1.minute < 1.minute )
      errors.add(:end_date, "should be atleast an hour booking")
    end
  end
def valid_customer_email
  if (!Customer.find(self.customre))
    errors.add(:customer_id ,"should be an actual customer email")
  end
end

  def self.booked_querry (customer_id)
    return Rental.find_by_customer_id_and_status(customer_id, "booked")
  end
end
