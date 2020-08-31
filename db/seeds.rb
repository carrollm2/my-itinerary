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


destination_3 = Destination.create(city: "White Fish, MT")
destination_3.events.build(description: "Brews and Views Craft Brewery Tour", event_date: DateTime.new(2020, 9, 4, 3, 00)).save
destination_3.events.build(description: "Brash Rodeo Summer Series", ticket_site: "https://glaciercountryrodeo.com/event/sept-5-rodeo/", event_date: DateTime.new(2020, 9, 5, 6, 00)).save


destination_4 = Destination.create(city: "Madison, WI")
destination_4.events.build(description: "Bitters Boot Camp", event_date: DateTime.new(2020, 12, 12, 2, 00)).save
destination_4.events.build(description: "Madison Ghost Walks - King Street Spirits", ticket_site: "https://americanghostwalks.com/haunted-madison-ghost-tours/", event_date: DateTime.new(2020, 9, 5, 7, 30)).save


destination_5 = Destination.create(city: "Bend, Oregon")
destination_5.events.build(description: "Dave Matthews Band", ticket_site: "https://bendconcerts.com/event/dave-matthews-band/", event_date: DateTime.new(2020, 9, 9, 5, 00)).save
destination_5.events.build(description: "Flight Night at Crater Lake Spirits", ticket_site: "https://www.facebook.com/craterlakespiritstastingroom", event_date: DateTime.new(2020, 9, 21, 5, 30)).save