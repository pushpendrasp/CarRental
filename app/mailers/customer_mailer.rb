class CustomerMailer < ApplicationMailer
  default from: "carrentalabpsh@gmail.com"
  def notify_user(car,customer)
    @customer = customer
    @car = car
    # emails = @customers.collect(&:email).join(",")
    mail to: @customer.email, subject: "Car Available"
  end
end
