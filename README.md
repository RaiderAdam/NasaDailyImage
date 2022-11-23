# NasaDailyImage
Comcast Code Test

Objective:
Create a small micro-service in a language of your choice that returns the NASA image of the day, for a given date, and write configuration to deploy the app to a Kubernetes cluster in a way that provides scalability and fault tolerance. Post your code to your Personal GitHub account.

Pre-requities:
Nasa has an Open API that requires an API key. Registering for an api key.

Assuming the NASA Astronomy Picture of the Day is the API being interacted with as opposed to the NASA image library.
URL: https://api.nasa.gov/planetary/apod
Query: https://api.nasa.gov/planetary/apod?api_key=<MyApiKey>&date=<YYYY-MM-DD>

Language: 
Going to use DART.  Started to read up on it during vacation and this is a good opportunity for a first application.

Usage for service:
See README.md under nasa_daily_service