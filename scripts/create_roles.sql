DO $$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'root') THEN
            CREATE ROLE root LOGIN PASSWORD 'c72b24690764c5eb1ee20e58715eaf7df48bf1c53414a320';
            GRANT ALL PRIVILEGES ON DATABASE microservice TO root;
            GRANT ALL PRIVILEGES ON SCHEMA public TO root;
            GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO root;
            GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO root;

        END IF;

        IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'auth') THEN
            CREATE ROLE auth LOGIN PASSWORD '130049746db4a52b4424726c0e2d043ef9e3fbc05b1d3cd1';
            GRANT ALL PRIVILEGES ON DATABASE microservice TO auth;
            GRANT ALL PRIVILEGES ON SCHEMA public TO auth;
            GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO auth;
            GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO auth;

        END IF;

        IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'audit') THEN
            CREATE ROLE audit LOGIN PASSWORD '80df715b62c8572aff9dbb930c4a079cf87bfdb71392b13a';
            GRANT ALL PRIVILEGES ON DATABASE microservice TO audit;
            GRANT ALL PRIVILEGES ON SCHEMA public TO audit;
            GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO audit;
            GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO audit;

        END IF;

        IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'tester') THEN
            CREATE ROLE tester LOGIN PASSWORD '5161e6ed8f440e9beaf7ffefad3161c2857c2348353c66d3';
        END IF;
    END $$;

CREATE DATABASE testing;
GRANT ALL PRIVILEGES ON DATABASE testing TO tester;
GRANT ALL PRIVILEGES ON SCHEMA public TO tester;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO tester;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO tester;
