class RegisterMailer < ApplicationRecord
  validates_uniqueness_of :customer_id, :scope => :car_id
  def self.send_mails(car_id)
    @car_id = car_id
    mailing_list = RegisterMailer.all
    mailing_list = mailing_list.where(:car_id => car_id)
    mailing_list.each do |email|
      CustomerMailer.notify_user(Car.find(email.car_id),Customer.find(email.customer_id)).deliver
      email.destroy
    end
  end
end
