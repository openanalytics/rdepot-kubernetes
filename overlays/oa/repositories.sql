
INSERT INTO repositories (id, publication_uri, name, server_address)
VALUES
  (
    1,
    "https://rdepot.openanalytics.eu/repo/private",
    "private",
    "http://rdepot-repo-0:8080/private"
  ), (
    2,
    "https://rdepot.openanalytics.eu/repo/public",
    "public",
    "http://rdepot-repo-1:8080/public"
  )
ON CONFLICT (id) DO UPDATE
  SET publication_uri = excluded.publication_uri
      name = excluded.name
      server_address = excluded.server_address;
