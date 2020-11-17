# Movie Wire
Welcome to Movie Wire!

This is an application for movie cretics who like to give their opion. This app will allow all user to sing in with google,
all user can create a movie and other users can make a review on it. Only one copy on the movie will exist in the database.
As a user you will see all the reviews you have created and your movies too.

## Installation 
Read all the way through before starting Installation:
- download or clone the repository
- ```cd``` into the directory
- run ```bundle install``` in your console
- create a file in the root directory called ```.env```
- inside ```.env```
- copy and paste the output into your ```.env``` file directly               
        GOOGLE_OAUTH_CLIENT_ID='your_id_goes_here' 
        GOOGLE_OAUTH_CLIENT_SECRET='your_secret_here'
    Instructions for Installation of Omniauth below. Make sure to paste in your specific id for the Client_Id and the Client Secret.
- create a file in the root directory called ```.gitignore```
- inside ```.gitignore```, enter ```.env```. This will make sure your ```.env``` file is not tracked in git
- run ```rake db:migrate```
- run ```rails s``` 
- open up your web browser and enter the local url provided by the rails server


## Dependencies
Make sure your Gemfile includes these:

```RUBY
source 'http://rubygems.org'
    git_source(:github) { |repo| "https://github.com/#{repo}.git" }
    gem "pry-rails"
    gem "pry"
    ruby '2.6.1'
    gem "devise", "~> 4.7"
    gem 'omniauth'
    gem 'omniauth-google-oauth2'
    gem 'dotenv-rails'
```
## Resources for Omniauth are found below:
Omniauth Installation
    https://ktor.io/docs/guides-oauth.html
    https://medium.com/@jenn.leigh.hansen/google-oauth2-for-rails-ba1bcfd1b863
* Configuration(config/initializers/devise.rb)
    config.omniauth :google_oauth2, ENV['GOOGLE_OAUTH_CLIENT_ID'], ENV['GOOGLE_OAUTH_CLIENT_SECRET']
.env
    GOOGLE_OAUTH_CLIENT_ID='your_id_goes_here'
    GOOGLE_OAUTH_CLIENT_SECRET='your_secret_here'
    add the .env file to the .gitignore file.
    Go create the application on the google developer platform and get the credentials from there. (As well as specify the authorized redirect URI to be http://localhost:3000/users/auth/google_oauth2/callback)
    Configure the consent screen on the console. 
    This required to set the domain. Used this domain: lvh.me/ (an alias for localhost). Once configuration was done with the consent screen. 
    Continue to follow the instructions in the medium article below.
    add columns to user table for full_name, uid, email and avatar_url
    add devise: :omniauthable, omniauth_providers: [:google_oauth_2]
    add link to sign in with google (in our case Devise did that for us, but if we wanted to add a custom image we could use a syntax like this: https://stackoverflow.com/questions/43280001/rails-image-as-a-link/48630860#48630860)
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
## Usage

To use Movie Wire. 

Sign Up for an Account with 'Movie Wire App'. 
Once logged in you will see all the movies in the application.  Select New Movie to add a new mocie, if you cant find the one you are looking for. If you see something you like click on it to view the profile for the movie. There you can see all the reviews or create a new one.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.
## License
[MIT](https://choosealicense.com/licenses/mit/)