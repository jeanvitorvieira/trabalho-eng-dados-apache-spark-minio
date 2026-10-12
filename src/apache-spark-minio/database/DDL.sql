CREATE TABLE IF NOT EXISTS games (
  id               SERIAL PRIMARY KEY,
  name             TEXT NOT NULL,
  platform         TEXT,
  release_date     DATE,
  metascore        SMALLINT,
  user_score       NUMERIC(3,1),
  developer        TEXT,
  publisher        TEXT,
  genre            TEXT
);

CREATE TABLE IF NOT EXISTS regional_sales (
  game_id        INTEGER NOT NULL REFERENCES games(id),
  na_sales       NUMERIC(7,2),
  eu_sales       NUMERIC(7,2),
  jp_sales       NUMERIC(7,2),
  other_sales    NUMERIC(7,2),
  global_sales   NUMERIC(7,2)
);

CREATE TABLE IF NOT EXISTS how_long_to_beat (
  game_id              INTEGER NOT NULL REFERENCES games(id),
  main_story_hours     NUMERIC(6,2),
  extras_hours         NUMERIC(6,2),
  completionist_hours  NUMERIC(6,2)
);

CREATE TABLE IF NOT EXISTS steam_metrics (
  game_id            INTEGER NOT NULL REFERENCES games(id),
  steam_appid        INTEGER,
  price              NUMERIC(8,2),
  achievements       INTEGER,
  positive_reviews   INTEGER,
  negative_reviews   INTEGER,
  avg_playtime       INTEGER
);

CREATE TABLE IF NOT EXISTS walkthrough_videos (
  game_id  INTEGER NOT NULL REFERENCES games(id),
  url      TEXT NOT NULL
);