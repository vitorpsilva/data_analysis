# Data Analysis
Data Analysis is a simple project using Docker, Postgres, Python, Scraping and others

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
### Building only the Database (Postgres)

```
$ cd data_analysis/postgres
$ docker build .

```

### Building only the Jupyter Lab

```
$ cd data_analysis/notebook
$ docker build .

```

## Running **all demo** with Docker Compose

```
cd data_analysis/
$ docker-compose up

```

## Using the app

* [Jupyter Lab](http://localhost:8888) - Jupyter Lab - http://localhost:8888



![API Home](/images/student-create.png)



* [Database](http://localhost:5432) - Postgres - http://localhost:5432



![API Home](/images/api-home.png)



![API Test](/images/api-test.png)

[Frontend](http://localhost:8080) - Tutor Match Frontend - http://localhost:8080
## PostgreSQL: localhost:5432 (
## Jupyter Lab: http://localhost:8888

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
