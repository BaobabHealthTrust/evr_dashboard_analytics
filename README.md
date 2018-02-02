# evr_dashboard

A Ruby on Rails (RoR) application

Ruby on Rails (MVC Framework for Ruby)

evr_dashboard_analytics is a dashboard application used to monitor the Zam'mudzi Mwathu (EVR) application software and network correspondents.

Language Framework
-
    Ruby --version (v2.4.0p0)
    
Development Framework
-
    Rails --version (v5.1.4)
    
Dependencies
-

    MySQL -V Ver 14.14 Distrib 5.7.21
    
    couchdb {"version":"17.10"}
    
    erlang --version V9.0.4
    
Clonning
-
Clone the application by running the following command in the directory you intend to clone the application to:

Using SSH:

    git clone git@github.com:BaobabHealthTrust/evr_dashboard_analytics.git
    
Using HTTPS:

    git clone https://github.com/BaobabHealthTrust/evr_dashboard_analytics.git
    
OR download as ZIP from:

    https://github.com/BaobabHealthTrust/evr_dashboard_analytics/archive/master.zip
        
Setup
-
Navigate into the root of the application.

Installing Dependencies
-
Now install the dependencies to allow smooth running and operation of the application. Run the following command;

    bundle install

Configuration
-

Running
-
To run the application on the default port (1337) run the below command in the root of the application:

    rails s
    
    and navigate to http://localhost:3000/ in your web browser
    
To run the application on a specific port (e.g 3009) run the below command in the root of the application:

    rails s -p 3009
    
    and navigate to http://localhost:3009/ in your web browser
    
    
NOTES:
-
By design, the dashboard has multiple pages represented as navigation tabs on the left sidebar, 
and each page is displayed for 5 minutes before navigating to the next page.

SCREENSHOTS
-

![Dashboard Screenshot](app/assets/images/dashboard.png?raw=true "Dashboard")
![Villages Screenshot](app/assets/images/villages.png?raw=true "Villages")
![Map View Screenshot](app/assets/images/map_view.png?raw=true "Map View")
