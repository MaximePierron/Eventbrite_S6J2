# README

ruby 2.5.1

## Gems

rails 5.2.4.3
letter_opener
dotenv
faker
devise

## A faire
'''
$ heroku run rails db:drop
$ heroku run rails db:create
$ heroku run rails db:migrate
$ heroku run rails db:seed
'''

Normalement letter-opener est désactivé donc il faut faire gaffe dans la console aux adresses mails créées pendant le seed et aller checker sur [Yopmail](https://yopmail.com/).

Ont été créé:
* La page d'accueil du site (events#index)
* La page profil d'un utilisateur (users#show) => Essaye de finir cette view
* La page de création d'un événement (events#new) => Super si tu arrives jusqu'ici
* La page d'affichage d'un événement (events#show) => Pour les plus déterminés

J'ai même rendu possible de modifier les infos de ton profil après que tu l'aies créé pour rajouter ton prénom, ton nom et une description. J'ai laissé les profils des autres utilisateurs visibles car je trouvais complètement idiot de ne pas le faire.

Tu trouveras [ici](https://eventbrite-thp-mp.herokuapp.com/) mon site en production sur heroku.
J'ai épuisé tout mes envois de mail possibles donc les BDD sont vides sur heroku, d'où le seed à faire.

Si tu veux essayer en local, je peux comprendre alors va dans **config/environments/development.rb** et remplace:  
'''
config.action_mailer.default_url_options = { :host => 'eventbrite-thp-mp.herokuapp.com' }
'''
  
par :  
'''
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
'''
  
**Amuse-toi bien !**



