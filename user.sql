CREATE TABLE users (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE users_sink (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO users (id, name) VALUES ('1', 'John');