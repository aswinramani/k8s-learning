Cluster Level Mental Model 

* Namespaces -> gateway, backend, storage, messaging, platform

1. Gateway

Handles JWT auth, routing, rate limiting. Acts as a first line of defence.

Programming Language/Frameworks: Golang

2. Backend

Contains APIs, business logic. 
Uses GRPC for data processing between quarkus and rust microservices. 
Small docs → gRPC (raw bytes)
Large docs → MinIO (storage) + gRPC (path reference)

Programming Language/Frameworks: Java + Quarkus + Gradle, Rust (will have CPU bound tasks) 


3. Storage

Stores structured, unstructured data. 

DB: PostgreSQL, MongoDB, MinIO (for storing and retrieving large docs) 

4. Messaging

Async event processing, bulk data processing in chunks.

Broker: RabbitMQ, AWS SQS could be used if unlimited backlog requirement comes up. 

5. Platform

Contains two components monitoring and gitops. Handles metrics collection, dashboards, alerting and GitOps. 

Monitoring tools: Prometheus, Grafana 
GitOps  tools: Argo CD, Flux

---

## Open Source & Licensing

All tools are free when self-hosted. Zero cloud bills, zero subscriptions.

| Tool | License | Cost |
|------|---------|------|
| Go | BSD | Free |
| Java (GraalVM CE) | GPL | Free |
| Quarkus | Apache 2.0 | Free |
| Rust | MIT/Apache 2.0 | Free |
| PostgreSQL | PostgreSQL License | Free |
| MongoDB | SSPL | Free (self-hosted) |
| MinIO | AGPL 3.0 | Free (self-hosted) |
| RabbitMQ | Mozilla Public License | Free |
| Prometheus | Apache 2.0 | Free |
| Grafana | AGPL 3.0 | Free (self-hosted) |
| Argo CD | Apache 2.0 | Free |
| Flux | Apache 2.0 | Free |
| minikube | Apache 2.0 | Free |
