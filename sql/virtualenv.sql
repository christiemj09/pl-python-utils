-- A table holding information on virtual environments.

DROP TABLE IF EXISTS virtualenv;

CREATE TABLE virtualenv (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE,
    path TEXT
);

-- ^^ First identify by name, but maybe take away the name field and identify
-- virtualenvs with user-defined tags to allow arbitrary differentiation (between
-- environment management tools, for instance, like virtualenvwrapper vs. conda).

-- Actually, keep name to mirror virtualenvwrapper most closely, but allow people
-- to break the pattern and use tags instead if they use more than one environment manager.
