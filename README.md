# README

# EvenBrites Project

Pour faire fonctionner le site, dans le dossier de l'application faire dans le terminal successivement : 
- rm -rf .git 
- bundle install 
- rails db:drop 
- rails db:create 
- rails db:migrate 
- rails db:seed 
- Sur le terminal copier coller:
PUBLISHABLE_KEY=pk_test_TYooMQauvdEDq54NiTphI7jx \
SECRET_KEY=sk_test_4eC39HqLyjWDarjtT1zdp7dc rails s

Enfin lancer sur votre navigateur: localhost:3000/events/
ou https://evenbrides.herokuapp.com/

# ENJOY IT!

#A tester pour les boutons liens

<a href="event_path(event.id)" class="btn btn-primary" role="button">Accéder à l'Event</a>

<%= link_to "Accéder à l'Event", event_path(event.id) :class => "btn btn-primary" %>




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

