CREATE TABLE PROJECT (
project_id INT AUTO_INCREMENT NOT NULL,
project_name VARCHAR(128) NOT NULL,
estimated_hours TINYINT(72),
actual_hours TINYINT(72),
difficulty VARCHAR(128),
notes TEXT ,
PRIMARY KEY (project_id)
);

CREATE TABLE CATEGORY(
category_id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(64),
PRIMARY KEY (category_id)
);

CREATE TABLE project_category(
project_id INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);

CREATE TABLE material (
material_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
material_name VARCHAR(64),
num_required INT,
cost DOUBLE (200, 2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE step (
step_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
step_text TEXT,
step_order INT,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);