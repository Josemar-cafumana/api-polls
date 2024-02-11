import z from "zod";
import { prisma } from "../../lib/prisma";
import { FastifyInstance } from "fastify";
import { redis } from "../../lib/redis";

export async function deletePoll(app: FastifyInstance) {
  app.delete("/polls/:pollId", async (request, reply) => {
    const getPoolParams = z.object({
      pollId: z.string().uuid(),
    });

    const { pollId } = getPoolParams.parse(request.params);

    const poll = await prisma.poll.findUnique({
      where: {
        id: pollId,
      },
    });

    if (!poll) {
      return reply.send({ message: "Poll not found." }).status(404);
    }

    await prisma.poll.delete({
      where: {
        id: pollId,
      },
    });

    await redis.del(pollId);

    return reply.send().status(201);
  });
}
