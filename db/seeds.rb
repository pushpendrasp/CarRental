# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Superadmin.create(name: 'Pushpendra', password: '123456789', email: 'psp@gmail.com')

Admin.create(email: 'xadmin@gmail.com', name: 'XAdmin', password: '123456789' )

Customer.create(email: 'abhi@gmail.com',name: 'Abhi', password: '123456789', rental_charge: '0.0')

Car.create(licenseplate: '0000001', manufacturer: 'Audi', model: 'R8',hour_rental: '200',style: 'Sedan',location: 'New York', status: 'Available')
Car.create(licenseplate: '0000002', manufacturer: 'Land Rover', model: 'Discovery',hour_rental: '100',style: 'SUV',location: 'Raleigh', status: 'Available')
Car.create(licenseplate: '0000003', manufacturer: 'BMW', model: 'i10',hour_rental: '500',style: 'Sedan',location: 'New York', status: 'Available')
Car.create(licenseplate: '0000004', manufacturer: 'Audi', model: 'A4',hour_rental: '400',style: 'Sedan',location: 'Cary', status: 'Available')
Car.create(licenseplate: '0000005', manufacturer: 'Chevrolet', model: 'Camero',hour_rental: '300',style: 'Coupe',location: 'Raleigh', status: 'Available')
Car.create(licenseplate: '0000006', manufacturer: 'Range Rover', model: 'Evok',hour_rental: '300',style: 'Sedan',location: 'Raleigh', status: 'Available')
Car.create(licenseplate: '0000007', manufacturer: 'Mercedes', model: 'C-Class',hour_rental: '250',style: 'Coupe',location: 'Raleigh', status: 'Available')
Car.create(licenseplate: '0000008', manufacturer: 'Mercedes', model: 'E-Class',hour_rental: '500',style: 'Sedan',location: 'Maryland', status: 'Available')
Car.create(licenseplate: '0000009', manufacturer: 'BMW', model: 'X6',hour_rental: '100',style: 'SUV',location: 'Raleigh', status: 'Available')
Car.create(licenseplate: '0000010', manufacturer: 'Rolls Royce', model: 'Phantom',hour_rental: '600',style: 'SUV',location: 'Raleigh', status: 'Available')