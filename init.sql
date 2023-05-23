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
VALUES ('1', '1', 'Headline 1', 'Lead paragraph 1', 'https://www.google.com', 'true', 'true', 'category 1'),
       ('2', '2', 'Headline 2', 'Lead paragraph 2', 'https://www.google.com', 'false', 'false', 'category 2'),
       ('3', '3', 'Headline 3', 'Lead paragraph 3', 'https://www.google.com', 'true', 'false', 'category 3');
