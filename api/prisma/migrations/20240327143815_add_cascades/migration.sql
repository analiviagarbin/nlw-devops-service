-- RedefineTables
BEGIN;

DROP TABLE IF EXISTS "new_check_ins";

DROP TABLE IF EXISTS "new_attendees";

ALTER TABLE "check_ins" DROP CONSTRAINT IF EXISTS "check_ins_attendee_id_fkey";

DROP TABLE IF EXISTS "attendees" CASCADE;

CREATE TABLE "attendees" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "event_id" TEXT NOT NULL,
    CONSTRAINT "attendees_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO "attendees" ("id", "name", "email", "created_at", "event_id")
SELECT "id", "name", "email", "created_at", "event_id" FROM "attendees";

ALTER TABLE "check_ins" ADD CONSTRAINT "check_ins_attendee_id_fkey" FOREIGN KEY ("attendee_id") REFERENCES "attendees" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;
-- RedefineTables
BEGIN;

DROP TABLE IF EXISTS "new_check_ins";

DROP TABLE IF EXISTS "new_attendees";

ALTER TABLE "check_ins" DROP CONSTRAINT IF EXISTS "check_ins_attendee_id_fkey";

DROP TABLE IF EXISTS "attendees" CASCADE;

CREATE TABLE "attendees" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "event_id" TEXT NOT NULL,
    CONSTRAINT "attendees_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO "attendees" ("id", "name", "email", "created_at", "event_id")
SELECT "id", "name", "email", "created_at", "event_id" FROM "attendees";

ALTER TABLE "check_ins" ADD CONSTRAINT "check_ins_attendee_id_fkey" FOREIGN KEY ("attendee_id") REFERENCES "attendees" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;