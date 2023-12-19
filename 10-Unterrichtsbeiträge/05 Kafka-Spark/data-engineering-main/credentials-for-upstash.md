Verwende diese Credentials, falls dein Kafka-Cluster nicht funktioniert oder das Nachrichten-Limit erreicht wurde.

```
bootstrap.servers=pro-horse-10077-eu2-kafka.upstash.io:9092
sasl.mechanism=SCRAM-SHA-256
security.protocol=SASL_SSL
sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required \
  username="cHJvLWhvcnNlLTEwMDc3JL_HSRE8IhJFx1QqsH5zSXl57ekHkAf4JDmbYMmSodE" \
  password="NzhiZTU1MDYtZTkxOC00NmQ4LTlmMjctNzk1ZmVjMzlmMzU5";
```