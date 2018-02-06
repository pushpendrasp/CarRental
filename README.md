# README  
Click on the link to go to Heruko ![Heruko Link](https://car-rental-proj2.herokuapp.com)  
Use seeds.rb file to find beease values or see below  
##### Testing done for model:customer.rb in test/models/customer_test.rb
##### Testing done for controller: customers_controller_test.rb  in test/controllers/customers_controller.rb
#### Please do not edit base admin and superadmin.  
#### Please do not use the back displayed on pages because they are misleading and are there due to Scaffolding.Most of them were removed some may be reamining please dont use those.
#### Bug: If you use browser back buttoon after logging out it will take you to last visited pages due to cache in browser, but you wont be able to do anything on the pages, that is you can only view pages cant do actions on them

To facilitate testing the time based features of the app, so that the testers do not have to wait for longer period.
While booking a car:
##### We have kept the advance booking time to be 5 minutes (in advance), rather than 1 hour.
##### We have taken the time elasticity for cancelling a booking to be 2 minutes rather than 30 minutes.
##### These conditions are checked at the time of making a new rental only, but customer can return a car before 5 minutes so as to ease testing for now.
The rates are per 5 mins and not per hour.  
Note: To make any changes in the above features, please mail us.  
abhardw3@ncsu.edu
### Super Admin:  
#### Seeds:  
email: psp@gmail.com  
Password: 123456789  
##### Abilities:  
  Can:  
   * view, edit, create and destroy  
   * Self  
   * Admins  
   * Customers  
   * Cars  
    Note: Please login as super admin and intuitively use buttons to perform the above tasks.  
   * Can check history or cars and customers.  
    Book car or cancel a booking, checkout car and return a car for a particular customer.  
##### Procedure for booking a car, by super admin,  on behalf of a customer:  
a) While logged in as super admin(at the home page)  
b) From the list of customers click “show” button, for the particular customer, for which you wish to book a car.  
Now, click the “cars” button to view the cars to be booked.  
Use the “book” button to book the car which is available and suitable.  
Note: If you search for a car here then the book button will vanish which is infornt of the car, the search and book completely work only when you are logged in as customer. So please donot use search if you are logged in as admin and superadmin and want to book on behalf of customer. 

##### Procedure for cancelling a booking, by superadmin,  on behalf of a customer:  
a) While logged in as super admin(at the home page)  
b) From the list of customers, click “show” button, for the particular customer, for which you wish cancel a booking.  
Now, click the “Cancel latest_booking” button to cancel the car booked.  

##### Procedure for checking out a booked car, by superadmin,  on behalf of a customer:  
a) While logged in as super admin(at the home page)  
b) From the list of customers, click “show” button, for the particular customer, for which you wish to checkout a car.  
Now, click the “checkout” button to checkout the car to be checked out.  

##### Procedure for returning a checked_out car, by superadmin,  on behalf of a customer:    
a) While logged in as super admin(at the home page)  
b) From the list of customers, click “show” button, for the particular customer, for which you wish cancel a booking.  
Now, click the “return” button to return the car to be booked.  

##### Procedure for adding a car
a) Click the cars link on Homepage 
b) Use Newcar link
c) On the new car page put Status"Available" ('we know it is a hassle and we are sorry') and for style use
  "Sedan", "Coupe", "SUV" ('sorry for the inconvinience they are case sensitive')


### Admin  
##### Seeds:
email: xadmin@gmail.com  
Password: 123456789  
##### Abilities:  
   Can:  
      Except for, viewing or making any changes to the superadmin, the admin can do all that a super admin can.  
Note: Please login as admin and intuitively use buttons to perform the above tasks.  

##### Procedure for booking/cancelling, checking out or returning a check-out car on the behalf of a customer:  
a) First login as admin, then follow the same procedure as the super admin does.   

##### Procdure for adding a car
a)Same as described in superadmin above.

### Customer  
##### Seeds:  
email: abhi@gmail.com  
Password: 123456789  
##### Abilities:  
  Can:  
   * Can edit self.  
   * View and book a car, with all relevant details.  
   * View its own history for car booking.  
   * Cancel booking, checkout or return(after using) a car.  
   * Any customer can signup for the first time and thereafter signin anytime.  
   * Customer can choose to register for email in case car is reserved or checkedout
   * Customer can give suggestion for new car
   * In case the customer is deleted the car is made available and the rental is deleted as well

##### Procedure for booking a car, by customer:  
a) While logged in as customer(at the home page)  
b) Click “cars” button.  
c) Use the “book” button to book the car which is available and suitable.  
Note: The customer can use the search engine to search for a particular car also the search is case sensitive pardon us for the inconvinience.  

##### Procedure for cancelling a booking, by customer:    
a) While logged in as customer(at the home page)   
b) Now, click the “Cancel latest_booking” button to cancel the car booked.  

##### Procedure for checking out a booked car, by customer:    
a) While logged in as customer(at the home page) 
b) Now, click the “checkout” button to checkout the car to be booked.  
c) The booking will be automatically cancelled if not checkedout in starttime +2 minutes.

##### Procedure for returning a checked out, by customer:  
a) While logged in as customer(at the home page)  
b) Now, click the “return” button to return the car to be booked.
c) The car will be automatically returned at the end date time of rental


### Car  
When a car is deleted by the admin or superadmin, the corresponding booking is automatically deleted .  
When a customer is deleted by the admin or superadmin while a car is checkedout or booked then that car is automatically made Available and the corresponding booking is automatically deleted.    
We are not showing Cancelled bookings in the history.  
