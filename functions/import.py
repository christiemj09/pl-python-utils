CREATE OR REPLACE FUNCTION public.import(module TEXT)
RETURNS VOID
AS $$
"""
Import a module.
"""

GD[module] = __import__(module)

$$ LANGUAGE plpythonu;