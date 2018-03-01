"""
Populate the virtualenv table with virtual environments.
"""

import sys
import os

from config import from_config
from ringmaster import sql


def virtualenvs(env_variable):
    """Generate names and paths of virtual environments."""
    env_dir = os.environ[env_variable]
    for fs_item in os.listdir(env_dir):
        path = os.path.join(env_dir, fs_item)
        if os.path.isdir(path):
            yield {'name': fs_item, 'path': path}


def main(env_variable, virtualenv_table):
    with sql.DatabaseEnvironment() as env:
        virtualenv = env.Table(virtualenv_table)
        env.conn.execute(
            virtualenv.insert(),
            list(virtualenvs(env_variable))
        )


if __name__ == '__main__':
    from_config(main)(sys.argv[1])

