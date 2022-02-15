# mobile-jwt-login

at backend-server directory

make .env file

ex)
JWT_SECRET = 'jwtsecret'

npm init

npx sequelize init

fill out config/config.json 

ex)

"development": {
    "username": "root",
    "password": "password",
    "database": "login",
    "host": "127.0.0.1",
    "dialect": "mysql"
  },

npx sequelize db:create

##process

0. signup
1. login
2. check db, response (access token, refresh token)
3. user : api call with access token
4. verify token -> reseponse
5. if expired return error -> client call post token -> server check refresh token -> get new access token
6. user : api call again with new access token
 
