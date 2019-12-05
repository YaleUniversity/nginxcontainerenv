## Simple nginx container to verify functionality of container secrets in spinup, or in docker

docker build .

example running container
docker run -it --env API_HOST=localhost --env API_PORT=1234 --env testsecret=blah --name nginxcontainerimage f4a8469b5de7

## dockerhub push

The dockerhub userID and repository name:
 * mydockerhubuser/createsecrets

docker login --username=mydockerhubuser

docker build . && docker rm friendlyimagename

docker tag 1c4394e94846 mydockerhubuser/createsecrets:nginxenv   

docker push mydockerhubuser/createscripts:nginxenv

### example running container
docker run -it --env API_HOST=localhost --env API_PORT=1234 --env testsecret=blah --name friendlyimagename f4a8469b5d
e7

get the container ID so you can connect to it and verify the image has the files modified with the ENVs
docker ps 

exec into the container
docker exec -it c9d631a99c95 bash|ash

check out files
cat /etc/nginx/conf.d/default.conf
resolver  127.0.0.11 valid=10s;  # recover from the backend's IP changing

server {
  listen  80;

  location / {
    root  /usr/share/nginx/html;
  }

  location /api {
    proxy_pass  http://localhost:1234;
    proxy_set_header  Host $http_host;
  }
}


server {
  listen  80;

  location / {
    root  /usr/share/nginx/html;
  }

  location /api {
    proxy_pass  http://localhost:1234;
    proxy_set_header  Host $http_host;
  }
}


# cat /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>

<p>testsecret: <b>blah</b></p>

<p>API_HOST: <b>localhost</b></p>
<p>API_PORT: <b>1234</b></p>

</body>
</html>

