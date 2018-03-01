CREATE OR REPLACE FUNCTION public.python_version()
RETURNS TEXT
AS $$
"""
Get the version of the Python interpreter that PL/Python functions are using.
"""

import sys

return '.'.join(map(str, sys.version_info))
$$
LANGUAGE plpythonu;
