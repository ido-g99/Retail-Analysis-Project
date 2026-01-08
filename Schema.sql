CREATE TABLE products (product_id INT AUTO_INCREMENT PRIMARY KEY, product_name VARCHAR(50), category VARCHAR(50), price DECIMAL(5,2));
CREATE TABLE stores (store_id INT AUTO_INCREMENT KEY, store_name VARCHAR(50), city VARCHAR(50));
CREATE TABLE sales (sale_id INT AUTO_INCREMENT PRIMARY KEY, store_id INT, product_id INT, sale_date DATE, sale_hour INT, quantity INT, FOREIGN KEY (store_id) REFERENCES stores(store_id), FOREIGN KEY (product_id) REFERENCES products(product_id));
