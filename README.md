# Data Analysis
Data Analysis is a simple project using Docker, PostgreSQL, Python, Scraping and others

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Docker version 18.09.2, build 6247962

```

### Installing

If you use Docker, you just need exec **$ docker-compose up** to use this project.

```
$ git clone https://github.com/vitorpsilva/data_analysis.git

```

## PostgreSQL: localhost:5432 (
## Jupyter Lab: http://localhost:8888
 
## Building the Database (PostgreSQL)

```
$ cd data_analysis/postgres
$ docker build .

```

## Running NodeJS

```
$ cd TutorMatch/tutormatch_back
$ npm install
$ nodemon --exec npm start OR $ npm start

```

## Running with Docker Compose

```
cd TutorMatch/
$ docker-compose up

```

## Using the app

* [Frontend](http://localhost:8080) - Tutor Match Frontend - http://localhost:8080



![API Home](/images/student-create.png)



* [Backend](http://localhost:3000) - API Catalog - http://localhost:3000



![API Home](/images/api-home.png)



![API Test](/images/api-test.png)



## Built With

* [NodeJS](https://nodejs.org/en/docs/) - Asynchronous event driven JavaScript runtime
* [Docker](https://www.docker.com/) - Container
* [Angular CLI](https://github.com/angular/angular-cli) - DevKit Tools

## Versioning

Please, see the [tags on this repository](https://github.com/vitorpsilva/tonsser/tags).

## Authors

* **Antonio Vitor** - [vitorpsilva](https://github.com/vitorpsilva)

See also the list of [contributors](https://github.com/vitorpsilva/tonsser/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
