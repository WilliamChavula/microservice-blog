## Project Description
A comprehensive blog application designed to support user posts (both text and image), comments, authentication, permission verification, email notifications, and detailed auditing and logging of application events.

---

## Architecture
For this project, I adopted a microservice architecture. The application was composed of several distinct services: a core posting and commenting service, an authentication service, a permission service, an audit service, a search service and a notification service. Each of these services was designed to run in its own container, enhancing modularity and scalability.

---

## Features
All the services, with the exception of the notification service, were implemented using `TypeScript` and the `Fastify` framework, which is built on `Node.js`. The notification service, to demonstrate versatility, was developed using `Python`.

---

## Technologies
For inter-service communication, such as verifying post write permissions between the core service and the permission service, I implemented `RPC (Remote Procedure Call)`. To manage application audit data and logs, I utilized `Kafka` and `Zookeeper` for reliable and scalable message queuing. For handling asynchronous tasks related to notifications, such as sending email notifications when a post receives a comment, I integrated `Redis` and `Celery`. For search, I utilized `elasticsearch`.

The technology stack for this project heavily relied on Docker for containerization of all services, `Kafka`, `Zookeeper`, and the various databases. As mentioned, I primarily used `TypeScript` and the `Fastify` framework for most services.

For data storage, posts, comments, and user data were stored in a `PostgreSQL` relational database to leverage its relational capabilities for this type of structured information. User permissions and audit logs were stored in `MongoDB`, given its flexibility for semi-structured data. Finally, `Redis` served as a `Celery` broker, facilitating efficient communication within the notification service. 

## References
- [Kafka and Zookeeper](https://kafka.apache.org/intro)
- [Redis](https://redis.io/docs/latest/)
- [Celery](https://docs.celeryq.dev/en/stable/)
- [Elasticsearch](https://www.elastic.co/docs/get-started/)
- [Typescript](https://www.typescriptlang.org/docs/)
- [Fastify](https://fastify.dev/docs/latest/)
- [Postgres](https://www.postgresql.org/docs/current/index.html)
- [Python](https://www.python.org/doc/)
- [Mongodb](https://www.mongodb.com/docs/guides/crud/install/)
- [Node.js](https://nodejs.org/docs/latest/api/)