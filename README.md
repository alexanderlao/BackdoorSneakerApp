Welcome to the Backdoor iOS application!
==============

The application name comes from the term “backdooring” which is commonly known among the sneaker community. The act of backdooring allows people to buy sneakers earlier than their intended release time by knowing someone who works at a sneaker retail store. Backdooring is commonly frowned upon in the sneaker community because it is generally unfair.

Application Usage
--------------

Main Screen - The app has four main functionalities which are listed as purple buttons at the bottom of the screen. The three labels at the top of the screen (total spent, total sold, and total profit) are updated as sneakers are bought and sold. The blank space in the middle is reserved for pictures of the user’s collection. After some sneakers are added to the collection (through the “Bought a Sneaker” functionality or manually adding them in the “View Collection” view) their pictures will be displayed on the main screen at random.

Bought a Sneaker - The user bought a sneaker, so they should enter its information. An example entry would be in the form:

* Brand: “Nike”
* Sneaker Name: “Air Jordan 1 Royal”
* Size: “11”
* Product Number: “555088-007”
* Retail Price: “160” (no dollar sign, this has to be a number)
* Price Paid: “244.53” (no dollar sign, this has to be a number)
* Date Bought: “04/01/17” (this is just a string, so enter the date to your preference)
* Quantity: “1” (this has to be a number)

Tapping on “Add an Image” accesses your phone’s camera roll (after asking permission) and allows the user to select an image. The image will appear at the bottom of the fill out form after selection.

Sold a Sneaker - The user sold a sneaker, so they should enter its information. Functionality is similar to “Bought a Sneaker.” As sneakers are sold, their quantities are updated in the main sneaker array by checking against their product number. 

For example, say a user bought five sneakers with product number “BB123.” Then the user sold three of the “BB123” sneaker. The collection will display “BB123” with a quantity of two. If the user sells the remaining two “BB123”, sneaker “BB123” will be removed from the collection tab.

View Collection - This displays the table view of the user’s collection. As sneakers are bought and sold, sneakers get added and removed, respectively, from this table. This view also allows manual addition and removal of sneakers (i.e. for the sneakers that were gifted to the user or sneakers that were given away). 

Tap the “+” icon in the top right corner of this view to bring up a form similar to the one in the “Bought a Sneaker” functionality to manually add a sneaker. 

Swipe left on a table entry and tap delete to remove a sneaker from the collection completely. This will remove all entries of that sneaker, regardless of quantity.

Tap on any entry in the table to bring up more details about the sneaker.

Schedule a Notification - This functionality is not ready. Sorry.
