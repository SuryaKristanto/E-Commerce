/* create database */
CREATE DATABASE ecommerce;

/* create table*/
CREATE TABLE IF NOT EXISTS roles(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, updated_at TIMESTAMP NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL);
CREATE TABLE IF NOT EXISTS users(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, role_id INT NOT NULL, email VARCHAR(255) NOT NULL UNIQUE, password VARCHAR(255) NOT NULL, reset_token VARCHAR(255), token_expired_at TIMESTAMP NULL DEFAULT NULL, name VARCHAR(255) NOT NULL, address TEXT NOT NULL, phone VARCHAR(255) NOT NULL UNIQUE, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, deleted_at TIMESTAMP NULL DEFAULT NULL, FOREIGN KEY (role_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE);
CREATE TABLE IF NOT EXISTS products(code INT PRIMARY KEY AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, price INT NOT NULL, weight INT NOT NULL, qty INT NOT NULL, updated_at TIMESTAMP NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, deleted_at TIMESTAMP NULL DEFAULT NULL);
CREATE TABLE IF NOT EXISTS orders(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, order_no INT NOT NULL UNIQUE, status VARCHAR(255) DEFAULT 'PENDING' NOT NULL, payment_method VARCHAR(255) NOT NULL, total_price INT, updated_at TIMESTAMP NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, deleted_at TIMESTAMP NULL DEFAULT NULL, FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE);
CREATE TABLE IF NOT EXISTS order_products(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, product_code INT NOT NULL, order_id INT NOT NULL, qty_order INT NOT NULL, updated_at TIMESTAMP NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, deleted_at TIMESTAMP NULL DEFAULT NULL, FOREIGN KEY (product_code) REFERENCES products(code) ON UPDATE CASCADE ON DELETE CASCADE, FOREIGN KEY (order_id) REFERENCES orders(id) ON UPDATE CASCADE ON DELETE CASCADE);

/* insert role */
INSERT INTO roles VALUES (DEFAULT, 'admin', DEFAULT, DEFAULT);
INSERT INTO roles VALUES (DEFAULT, 'member', DEFAULT, DEFAULT);
INSERT INTO roles VALUES (DEFAULT, 'guest', DEFAULT, DEFAULT);