-- ========================================================
-- Topic: Video Game Store & Community Hub Database
-- Database Name: gamers_hub_db
-- ========================================================

-- Step 1: Create the Database
CREATE DATABASE gamers_hub_db;

-- Step 2: Select the Database for use
USE gamers_hub_db;

-- Step 3: Create the Users Table
-- Stores information about registered gamers on the platform.
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 4: Create the Games Table
-- Stores available video games in the store.
CREATE TABLE games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    price DECIMAL(6, 2) NOT NULL,
    release_year INT NOT NULL
);

-- Step 5: Create the Purchases Table
-- Tracks which users bought which games (Many-to-Many relationship linked via table).
CREATE TABLE purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE
);

-- Step 6: Create the Reviews Table
-- Allows users to leave star ratings and reviews for games.
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE
);

-- ========================================================
-- Step 7: Insert Sample Data
-- ========================================================

-- Insert users
INSERT INTO users (username, email) VALUES 
('ShadowGamer99', 'shadow99@example.com'),
('PixelQueen', 'pixelqueen@example.com'),
('ByteRunner', 'byterunner@example.com');

-- Insert games
INSERT INTO games (title, genre, price, release_year) VALUES 
('Cyber Odyssey', 'Action RPG', 59.99, 2077),
('Starlight Farm', 'Simulation', 29.99, 2023),
('Neon Drift 2', 'Racing', 39.99, 2025);

-- Insert purchases
INSERT INTO purchases (user_id, game_id) VALUES 
(1, 1), -- ShadowGamer99 bought Cyber Odyssey
(1, 3), -- ShadowGamer99 bought Neon Drift 2
(2, 2); -- PixelQueen bought Starlight Farm

-- Insert reviews
INSERT INTO reviews (user_id, game_id, rating, comment) VALUES 
(1, 1, 5, 'Absolute masterpiece! The graphics and story are incredible.'),
(2, 2, 4, 'Very relaxing game, great way to unwind after work.');

-- ========================================================
-- Step 8: Query the Data to Verify
-- ========================================================
SELECT * FROM users;
SELECT * FROM games;
SELECT * FROM purchases;
SELECT * FROM reviews;
