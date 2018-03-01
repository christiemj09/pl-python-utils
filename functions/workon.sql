CREATE OR REPLACE FUNCTION public.workon(venv_name TEXT)
RETURNS VOID
AS $$
BEGIN
    PERFORM workon_from_path("path") FROM virtualenv WHERE "name" = venv_name;
END;
$$
LANGUAGE plpgsql