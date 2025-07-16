CREATE TABLE companies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    website TEXT,
    phone TEXT,
    linkedin_url TEXT,
    notes TEXT
    );

CREATE TABLE agencies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    website TEXT,
    phone TEXT
    );

CREATE TABLE contacts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    surname TEXT,
    email TEXT,
    phone TEXT,
    linkedin_url TEXT,
    company_id INTEGER,
    agency_id INTEGER,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE SET NULL,
    FOREIGN KEY (agency_id) REFERENCES agencies (id) ON DELETE SET NULL
    );

CREATE TABLE applications (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    job_title TEXT NOT NULL,
    job_link TEXT,
    location TEXT
    date_applied DATE DEFAULT CURRENT_DATE,
    status TEXT CHECK (status IN ('To Do', 'Applied', 'In Progress', 'Interview', 'Interviewed', 'Successful', 'Unsuccessful')) DEFAULT 'Bookmarked',
    company_id INTEGER,
    agency_id INTEGER,
    description TEXT,
    FOREIGN KEY (company_id) REFERENCES companies (id) ON DELETE SET NULL,
    FOREIGN KEY (agency_id) REFERENCES agencies (id) ON DELETE SET NULL
    );

CREATE TABLE activity_log (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATE DEFAULT CURRENT_DATE,
    time TEXT,
    activity TEXT
    )