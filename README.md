# REST-API-MongoDB
A simple JavaScript API to register or signup user in the MongoDB database

# Run by node
1. npm install 
2. node app.js

3. Create database and user

docker exec -ti <database-instance> bash
mongosh -u mongo -p 12345
use my_db
db.createUser( { user: "JS1", pwd: "12345", roles: [{ role: "readWrite", db: "info" }] } )
show users

4. Now application is up and running and you can send request with below commands

we make request with curl here, but you can do it via an application or postman

curl -X POST -H "Content-Type: application/json" -d '{
  "username": "<your-username>",
  "password": "<your-password>"
}' <your-api-url>/api/register

In this part which is called login you can assure of your registration by this curl request 
login
credentials_base64=$(echo -n "username:password" | base64)
curl -X POST -H "Authorization: Basic $credentials_base64" http://0.0.0.0:4000/api/login

# Run in docker 
1. Build image
docker build -t rest-api:1.0.0 .

2. Run api and database
docker-compose up -d

3. For setting up database and send requests to app, you can run 3 and 4 steps in node part

# Deploy in kubernetes 
1. change directory to Helm
2. Fill in the parameters in secret files mongodb uri connection string in connection-db.yaml file in base 64 (echo -n “mongodb://mongo:12345@mongodbservice:27017/admin” | base64)
3. Fill in the username and password of mongodb database in db-secret.yaml file with base 64 (echo -n "mongo" | base64) (echo -n "12345" | base64)
4. helm install rest . -n rest --create-namespace

5. For setting up database and send requests to app, you can run 3 and 4 steps in node part
