b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042

b1.beers.create name:"Iso 3", style:"Lager"
b1.beers.create name:"Karhu", style:"Lager"
b1.beers.create name:"Tuplahumala", style:"Lager"
b2.beers.create name:"Huvila Pale Ale", style:"Pale Ale"
b2.beers.create name:"X Porter", style:"Porter"
b3.beers.create name:"Hefezeizen", style:"Weizen"
b3.beers.create name:"Helles", style:"Lager"

User.create username:"admin", password:"Admin1", password_confirmation:"Admin1", admin:"true"
User.create username:"matti", password:"Matti1", password_confirmation:"Matti1", admin:"false"
