
# USER 
create openshift account

create new project 

deploy image and select as image webjframework/webjframework:openshift

Optional change ENVIROMENT VAR  WAR_INI_WGET_URL to your Wget path for WebJ.war and webjdata.ini without / at the end !!!
e.g WAR_INI_WGET_URL https://raw.githubusercontent.com/your_username/your_repository/master



deploy ...

add storage and mount to /MYPERSDATA

go to services and add create route for your deploy :

every time you want to get new war just scale down and up !


# IMAGE CREATE-UPDATE

docker login add webjframework credentials

git clone openshift-docker-image

cd openshift-docker-image

change the settings dockerfile ...

docker build

docker images and get the latest id

docker tag id webjframework/webjframework:openshift
docker push  webjframework/webjframework:openshift
