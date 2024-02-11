-- DropForeignKey
ALTER TABLE "poll_options" DROP CONSTRAINT "poll_options_pool_id_fkey";

-- DropForeignKey
ALTER TABLE "votes" DROP CONSTRAINT "votes_pollOptionId_fkey";

-- DropForeignKey
ALTER TABLE "votes" DROP CONSTRAINT "votes_pool_id_fkey";

-- AddForeignKey
ALTER TABLE "poll_options" ADD CONSTRAINT "poll_options_pool_id_fkey" FOREIGN KEY ("pool_id") REFERENCES "polls"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "votes" ADD CONSTRAINT "votes_pollOptionId_fkey" FOREIGN KEY ("pollOptionId") REFERENCES "poll_options"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "votes" ADD CONSTRAINT "votes_pool_id_fkey" FOREIGN KEY ("pool_id") REFERENCES "polls"("id") ON DELETE CASCADE ON UPDATE CASCADE;
