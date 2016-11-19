# Web-App-Lab-1
## Author : Laurent Chion

### Install
  - Clone the project :
    ````
      git clone https://github.com/LaurentChion/Web-App-Lab-1.git
    ````
  - move in :
    ````
    cd Web-App-Lab-1
    ````
  - install dependencies :
    ````
    mvn install
    ````
  - deploy app :
    ````
    mvn tomcat7:redeploy
    ````
  - go to http://localhost:8081/CountDownWebApp/

### Done / Undone

- [x] Using Git, Maven, JEE
- [x] Countdowns are stored into Cookies
- [x] Cookies expire when countdown reach 0.
- [x] Locale is use to calculate time differences between country
- [x] Times are calculate on server side
- [x] Websocket is use by client to send list of countdown and by server to result
- [x] Error pages are custom
- [ ] Test are made to verify component
