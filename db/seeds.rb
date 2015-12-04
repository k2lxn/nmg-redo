# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MortgageCalculator.create(loan_amt: 500000, rate: 4.25, term: 15.0)

PrequalificationCalculator.create(income: 40000, debt: 200, rate: 4.25, 
																	term: 15.0, down: 20.0)