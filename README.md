<h1>Lunch And Learn</h1>
<h2>Learn While You Eat</h2>

<h2>About</h2>
This Project builds a backend application that searches for cuisines by country and provide more information about the country. Users can search for recipes by country, favorite recipes and learn more about the particular country through learning resources like youtube videos.

<h2>Getting Started</h2>
<h3>Running On</h3>
* Rails 7.0.6 <br>
* Ruby 3.2.2 <br>

<h3>Get the following API Keys</h3>

* EDAMAM Recipe Key: https://developer.edamam.com/edamam-recipe-api

* Youtube API Key: https://developers.google.com/youtube/v3/getting-started

* Pexels API Key: https://www.pexels.com/api/
<br>
<h3>Local Installation</h3>
To get a local copy, follow these instructions<br>
1. Fork the Project<br>
2. Clone the repo<br>

```
git clone git@github.com:NickTassinari/lunch-and-learn.git
```
<br>
3. Install gems <br>

```
bundle install
```
<br>
4. Create the database 


```
rails db:{create,migrate} 
```
<br>
5. Add Figaro 

```
bundle exec figaro install
```
<br>
6. Enter your API keys in the config/application.yml file

```
edam_app_id: <your app id>
edam_app_key: <your key>	
you_tube_key: <your key>
pexels_token: <your key>
```



<h2>API Endpoints</h2>

<h3>GET</h3>
/api/v1/recipes (gets recipes based on country)<br>
/api/v1/learning_resources (gets videos and images about given country)<br>
/api/v1/favorites (gets user favorites)<br>

<h3>POST</h3>
/api/v1/users (creates users)<br>
/api/v1/sessions (gets user information)<br>
/api/v1/favorites (creates new favorite recipe for user)<br>

<h3>DELETE</h3>
/api/v1/favorites (deletes user favorite)<br>

<br>

<h2>Author</h2>
<h3>Nick Tassinari</h3>

* GitHub: https://github.com/NickTassinari <br>

* LinkedIn: https://www.linkedin.com/in/tassinarinicholas/