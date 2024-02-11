-- CreateTable
CREATE TABLE "poll_options" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "pool_id" TEXT NOT NULL,

    CONSTRAINT "poll_options_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "poll_options" ADD CONSTRAINT "poll_options_pool_id_fkey" FOREIGN KEY ("pool_id") REFERENCES "polls"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
