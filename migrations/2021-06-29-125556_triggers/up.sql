-- Create a function for query optimization
CREATE OR REPLACE FUNCTION make_tsvector(firstf text, secondf text)
  RETURNS tsvector AS $$
BEGIN
  RETURN (setweight(to_tsvector(firstf), 'A') ||
    setweight(to_tsvector(secondf), 'B'));
END
$$ LANGUAGE 'plpgsql' IMMUTABLE;
