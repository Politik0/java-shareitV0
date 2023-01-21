CREATE TABLE IF NOT EXISTS users
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(512) NOT NULL,
    CONSTRAINT UQ_USER_EMAIL UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS requests
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    description VARCHAR,
    author_id BIGINT REFERENCES users (id) ON DELETE CASCADE,
    created TIMESTAMP WITH TIME ZONE
);

CREATE TABLE IF NOT EXISTS items
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    available BOOLEAN NOT NULL,
    user_id BIGINT REFERENCES users (id) ON DELETE CASCADE,
    REQUEST_ID BIGINT
CONSTRAINT request_delete REFERENCES requests (id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS bookings
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    item_id BIGINT REFERENCES items (id) ON DELETE CASCADE,
    booker_id BIGINT REFERENCES users (id) ON DELETE CASCADE,
    status VARCHAR,
    start_booking TIMESTAMP WITHOUT TIME ZONE,
    end_booking TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE IF NOT EXISTS comments
(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    text VARCHAR,
    item_id BIGINT REFERENCES items (id) ON DELETE CASCADE,
    author_id BIGINT REFERENCES users (id) ON DELETE CASCADE,
    created TIMESTAMP WITH TIME ZONE
);
