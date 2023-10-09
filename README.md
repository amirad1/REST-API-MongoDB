# REST-API-MongoDB
A simple JavaScript API to register or signup user in the MongoDB database

# Run by node
1. npm install 
2. node app.js

# Run in docker 
1. Build image
docker build -t rest-api:1.0.0 .

2. Run api and database
docker-compose up -d

3. Create database and user

docker exec -ti <database-instance> bash
mongosh -u mongo -p 12345
use my_db
db.createUser( { user: "JS1", pwd: "12345", roles: [{ role: "readWrite", db: "info" }] } )
show users

4. Now application is up and running and you can send request with below commands

add user
curl -X POST -H "Content-Type: application/json" -d '{
  "username": "<your-username>",
  "password": "<your-password>"
}' <your-api-url>/api/register

login
credentials_base64=$(echo -n "username:password" | base64)
curl -X POST -H "Authorization: Basic $credentials_base64" http://0.0.0.0:4000/api/login

# Deploy in kubernetes 
1. change directory to Helm
2. Helm install 
