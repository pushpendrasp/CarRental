require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "name should be present for customer" do
    customer = Customer.new(:email =>"abhi@gmail.com", :password => "123456789" )
    assert_not customer.save
  end
  test "email should be present" do
    customer = Customer.new(:name => "abhishek", :password => "123456789" )
    assert_not customer.save
  end
  test "password should be present" do
    customer = Customer.new(:name => "abhishek", :email =>"abhi@" )
    assert_not customer.save

  end
  test "password should be of 8 characters minimum" do
    customer = Customer.new(:name => "abhishek", :email =>"abhi@gmail.com", :password => "1234567" )
    assert_not customer.save
  end
  test"should not save customer with mail without @ and .**" do
    customer = Customer.new(:name => "abhishek", :email =>"abhi@", :password => "123456789" )
    assert_not customer.save
  end

  test "two customers cant have same email" do
    customer = Customer.new(:name => "abhishek", :email=> "abhishek@gmail.com", :password=> "123456789")
    assert customer.save
    customer = Customer.new(:name => "abhishek", :email=> "abhishek@gmail.com", :password=> "123456789")
    assert_not customer.save
  end


end
