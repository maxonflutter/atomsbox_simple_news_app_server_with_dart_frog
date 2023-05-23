CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    author_id INTEGER REFERENCES authors(id),
    headline VARCHAR(100) NOT NULL,
    lead_paragraph VARCHAR(100) NOT NULL,
    image_url VARCHAR(100) NOT NULL,
    is_breaking_news BOOLEAN NOT NULL,
    is_popular BOOLEAN NOT NULL,
    category VARCHAR(100) NOT NULL,
);

INSERT INTO authors (id, name, surname)
VALUES ('1', 'Massimo', 'D.'),
       ('2', 'John', 'Smith'),
       ('3', 'Jane', 'Doe');

INSERT INTO articles (id, author_id, headline, lead_paragraph, image_url, is_breaking_news, is_popular, category)
VALUES ('1', '1', 'Headline 1', 'This is article #1', 'https://www.atomsbox.com', 'true', 'true', 'category 1'),
       ('2', '2', 'Headline 2', 'This is article #2', 'https://www.atomsbox.com', 'false', 'false', 'category 2'),
       ('3', '3', 'Headline 3', 'This is article #3', 'https://www.atomsbox.com', 'true', 'false', 'category 3');
       ('4', '1', 'Headline 4', 'This is article #4', 'https://www.atomsbox.com', 'false', 'true', 'category 4'),
       ('5', '2', 'Headline 5', 'This is article #5', 'https://www.atomsbox.com', 'true', 'true', 'category 5'),
       ('6', '3', 'Headline 6', 'This is article #6', 'https://www.atomsbox.com', 'false', 'false', 'category 6');