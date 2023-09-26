# REST-API-MongoDB
A simple JavaScript API to register or signup user in the MongoDB database


docker build -t rest-api .

docker-compose up -d


mongosh -u mongo -p 12345
use my_db
db.createUser( { user: "JS1", pwd: "12345", roles: [{ role: "readWrite", db: "info" }] } )
show users
show tables
db.users.find()


add user
curl -X POST -H "Content-Type: application/json" -d '{
  "username": "<your-username>",
  "password": "<your-password>"
}' <your-api-url>/api/register

login
credentials_base64=$(echo -n "username:password" | base64)
curl -X POST -H "Authorization: Basic $credentials_base64" http://192.168.1.10:4000/api/login
