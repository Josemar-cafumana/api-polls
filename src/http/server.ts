import fastify from "fastify";
import { createPoll } from "./routes/create-poll";
import { getPoll } from "./routes/get-poll";
import { voteOnPoll } from "./routes/vote-on-poll";
import cookie, { FastifyCookieOptions } from "@fastify/cookie";
import websocket from "@fastify/websocket";
import { pollResults } from "./ws/poll-results";
import { deletePoll } from "./routes/delete-poll";
import { getPolls } from "./routes/get-polls";

const app = fastify();

app.register(cookie, {
  secret: "43wsddvccx", 
  hook: "onRequest", 
} as FastifyCookieOptions);

app.register(websocket)

app.register(getPolls);
app.register(createPoll);
app.register(getPoll);
app.register(deletePoll);

app.register(voteOnPoll);
app.register(pollResults);

app.listen({ port: 3333 }).then(() => {
  console.log(`Server Running on port 3333`);
});
