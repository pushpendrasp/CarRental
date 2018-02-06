class Car < ApplicationRecord
  validates :licenseplate, :presence => true, length: {is: 7},
            uniqueness: { case_sensitive: false }
  validates :manufacturer, :presence => true
  validates :model, :presence => true
  validates :hour_rental, :presence => true
  validates :style, :presence => true, inclusion: {in: %w(Coupe Sedan SUV)}
  validates :location, :presence => true
  validates :status, :presence => true, inclusion: {in: %w(Checkout Available Reserved)}

  def available
    self.status = "Available"
    self.save!
    RegisterMailer.send_mails(self.id)
    self.save!
  end

  def reserved
    self.status =  "Reserved"
    self.save!
  end

  def checkout
    self.status = "Checkout"
    self.save!
  end
end
