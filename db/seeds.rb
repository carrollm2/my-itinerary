# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Destination.destroy_all
Event.destroy_all

destination_1 = Destination.create(city: "Nashville, TN")
destination_1.events.build(description: "James Gregory Comedy Show", ticket_site: "https://zaniesnashvilletickets.laughstub.com/event.cfm?cart&id=542287", event_date: DateTime.new(2020, 11, 15, 8, 00)).save
destination_1.events.build(description: "Rob Schneider Comedy Show", ticket_site: "https://zaniesnashvilletickets.laughstub.com/event.cfm?cart&id=541955", event_date: DateTime.new(2020, 11, 15, 8, 00)).save


destination_2 = Destination.create(city: "Park City, UT")
destination_2.events.build(description: "Tour de Suds Bike Tour", ticket_site: "https://tourdessuds.athlete360.com", event_date: DateTime.new(2020, 9, 13, 12, 00)).save
destination_2.events.build(description: "Sunday Funday: Open Studio Park City", ticket_site: "https://app.getoccasion.com/xp/v3xs2SNT?time_slot_id=gubrq6Wu7oQP", event_date: DateTime.new(2020, 9, 16, 12, 00)).save