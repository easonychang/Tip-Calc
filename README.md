# Tip Easy

This is a tip calculator

What did I learned?
I learned the basics in Swift, such as View Controller, i.e. label, text,
segmented control, button, number pads. 

I learned how to use the CoreLocation framework in Swift as well as the
interfaces of CLGeocode and CLLocationManager.

CLLocationManager was used to extract the user’s location, i.e. longitude and
latitude. 
CLGeocode was then used to take in the user’s location and extract the zip code
of the user’s current whereabouts. So I can use it to look up the sales tax
rate.

I learned how to process data. I found the data of sales tax rates by locations
on http://www.taxrates.com/calculator/ 

Then I need to process the data so that I will be able to do fast look ups of
tax rates by a state’s zip code. After processing the data in csv file, I used
this library made by Daniel1of1 to parse the csv data.
https://github.com/Daniel1of1/CSwiftV


