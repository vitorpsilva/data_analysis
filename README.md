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

## Using the demo

* [Jupyter Lab](http://localhost:8888) - Jupyter Lab - http://localhost:8888

![Jupyter Welcome](/images/jupyterlab_welcome.png)

![Jupyter Welcome](/images/jupyterlab_example.png)

* [Database](http://localhost:5432) - Postgres - http://localhost:5432

![Database Connection](/images/postgres_connection.png)

![Database Structure](/images/postgres_structure.png)


## Built With

* [Docker](https://www.docker.com/) - Container
* [PostgreSQL](https://www.postgresql.org/about/) - Open source            object-relational database system
* [Jupyter Lab](https://github.com/jupyterlab/jupyterlab) - An extensible environment for interactive and reproducible computing, based on the Jupyter Notebook and Architecture

## Versioning

Please, see the [tags on this repository](https://github.com/vitorpsilva/data_analysis/tags).

## Authors

* **Antonio Vitor** - [vitorpsilva](https://github.com/vitorpsilva)

See also the list of [contributors](https://github.com/vitorpsilva/data_analysis/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
