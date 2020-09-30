
INSERT INTO repository (id, publication_uri, "name", server_address)
VALUES
  (
    1,
    'https://example.domain.com/repo/myrepo',
    'myrepo',
    'http://rdepot-repo:8080/myrepo'
  )
ON CONFLICT (id) DO UPDATE
  SET publication_uri = excluded.publication_uri,
      "name" = excluded.name,
      server_address = excluded.server_address;

