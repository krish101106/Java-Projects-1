# HR Management System

A straightforward HR management web app built with Java Servlets, JSP, and JDBC. It gives HR staff tools to manage employees and lets employees update their own profiles — nothing more, nothing less.

---

## Features

### HR
- Add new employees
- View the full employee list with details (name, role, department, salary)
- Edit employee information
- Delete employees

### Employee
- Log in with credentials
- View and edit their own profile

---

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Java |
| Web Layer | Jakarta Servlets + JSP |
| Database Access | JDBC |
| Database | MySQL |
| Server | Apache Tomcat |
| Architecture | MVC |

---

## Project Structure

```
HRManagement/
├── src/
│   ├── controller/       # Servlets — handle HTTP requests and route logic
│   ├── dao/              # Data Access Objects — all DB queries live here
│   ├── model/            # Plain Java classes representing entities (Employee, etc.)
│   └── util/             # Utility classes (e.g., DBConnection)
│
└── web/
    ├── employee/         # JSP pages for the employee role
    ├── hr/               # JSP pages for the HR role
    ├── index.jsp         # Login page (entry point)
    └── logout.jsp        # Handles session invalidation and redirect
```

### Layer responsibilities

- **Controller** — Servlets receive requests, call the appropriate DAO methods, put data in request/session scope, and forward to a JSP.
- **DAO** — Each DAO class handles one entity. SQL queries are written here, keeping business logic out of JSPs.
- **Model** — Simple POJOs with getters/setters. No logic, just data.
- **Util** — `DBConnection` (or similar) centralizes the JDBC connection setup so it isn't duplicated everywhere.

---

## Architecture Overview

```
Browser
  │
  ▼
Jakarta Servlet (Controller)
  │  reads/writes via
  ▼
DAO Layer (JDBC)
  │  maps rows to
  ▼
Model (POJOs)
  │
  ▼  (set as request attributes)
JSP (View)
  │
  ▼
Browser (rendered HTML)
```

The login page checks credentials and sets a session variable (role: `HR` or `Employee`). Servlets check this on every request to decide what the user is allowed to see or do.

---

## Database Schema

Five tables. Relationships shown below.

```
Department (1) ──────── (N) Employee (N) ──────── (1) Role
                              │ (1)
                    ┌─────────┴──────────┐
                    │                    │
                   (N)                  (1)
                 Salary               Login
```

| Table | PK | Notable columns |
|---|---|---|
| `department` | `dept_id` | `dept_name` |
| `role` | `role_id` | `role_name` |
| `employee` | `emp_id` | `name`, `surname`, `experience_years`, `dept_id` (FK), `role_id` (FK) |
| `salary` | `salary_id` | `emp_id` (FK), `amount`, `effective_date` |
| `login` | `login_id` | `emp_id` (FK), `username`, `password` |

```sql
CREATE TABLE department (
    dept_id   INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE role (
    role_id   INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(100) NOT NULL
);

CREATE TABLE employee (
    emp_id           INT PRIMARY KEY AUTO_INCREMENT,
    name             VARCHAR(100) NOT NULL,
    surname          VARCHAR(100) NOT NULL,
    experience_years INT          NOT NULL,
    dept_id          INT,
    role_id          INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
    FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE TABLE salary (
    salary_id      INT PRIMARY KEY AUTO_INCREMENT,
    emp_id         INT NOT NULL,
    amount         DECIMAL(10, 2) NOT NULL,
    effective_date DATE NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

CREATE TABLE login (
    login_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id   INT NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);
```

---

## Running It Locally

### Prerequisites

- JDK 11+
- Apache Tomcat 10+ (for Jakarta EE namespace)
- MySQL 8+
- An IDE like IntelliJ IDEA or Eclipse with a Tomcat run configuration

### Steps

**1. Clone the repo**

```bash
git clone https://github.com/krish101106/Jaba-Project1/HRManagement.git
cd HRManagement
```

**2. Set up the database**

Create a MySQL database and run the schema file:

```sql
CREATE DATABASE hrms;
USE hrms;
-- then run your schema/seed SQL
```

**3. Configure the DB connection**

In `src/util/DBConnection.java` (or wherever your connection is set up), update:

```java
private static final String URL = "jdbc:mysql://localhost:3306/hrms";
private static final String USER = "your_mysql_user";
private static final String PASSWORD = "your_mysql_password";
```

**4. Deploy to Tomcat**

- Import the project into your IDE
- Add a Tomcat server configuration
- Deploy the project and start the server

**5. Open in browser**

```
http://localhost:8080/HRManagement/
```

You'll land on the login page. Use HR or Employee credentials to log in.

---

## What This Project Demonstrates

- **MVC separation** — Controllers, views, and data access are cleanly separated
- **Session-based auth** — Role-based access control using `HttpSession`
- **Raw JDBC** — No ORM; direct SQL with `PreparedStatement` to prevent SQL injection
- **Jakarta Servlet lifecycle** — `doGet`/`doPost` handling, request forwarding, redirects
- **JSP as a view layer** — EL expressions and JSTL for rendering dynamic content

---

## Notes

- There's no frontend framework here — just JSP, HTML, and CSS
- No Spring, no Hibernate — this is intentionally vanilla Java EE to keep things transparent
- Passwords should be hashed before storing; if they aren't yet, that's a known gap to address

---

## License

MIT
