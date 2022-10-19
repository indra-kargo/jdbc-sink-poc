# Command

## 1. Running docker
```
docker compose up -d
```

## 2. Connect to Database and create DB
```
CREATE TABLE users (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE users_sink (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
```

## 3. Add Sourcing and Sinking connector

```
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" 127.0.0.1:8083/connectors/ --data "@debezium.json"
```

```
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" 127.0.0.1:8083/connectors/ --data "@sink.json"
```

## 4. Insert, Update and Delete in Users Row
```
INSERT INTO users (id, name) VALUES ('1', 'John');
UPDATE users SET name='John Thor' WHERE id='1';
DELETE users WHERE id='1';
```

### Tail docker log for kafka connect
```
docker logs --follow <container id>
```

### Get Logger Level
```
curl -Ss http://localhost:8083/admin/loggers
```


### Change Logger Level for connector
```
curl -s -X PUT -H "Content-Type:application/json" \
http://localhost:8083/admin/loggers/io.confluent.connect.jdbc.JdbcSinkConnector \
-d '{"level": "TRACE"}'
```
```
curl -s -X PUT -H "Content-Type:application/json" \
http://localhost:8083/admin/loggers/org.apache.kafka.connect.runtime.WorkerSourceTask \
-d '{"level": "TRACE"}'
```

