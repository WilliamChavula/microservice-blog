import "dotenv/config";
import { z } from "zod";

const apiGlobalConfig = z.object({
  testCredentials: z.object({
    TEST_DB_USER: z.string({ message: "This value cannot be empty" }),
    TEST_DB_PWD: z.string({ message: "This value cannot be empty" }),
    TEST_DB_NAME: z.string({ message: "This value cannot be empty" }),
  }),
});

export const {
  data: { testCredentials },
} = apiGlobalConfig.safeParse({
  testCredentials: {
    TEST_DB_USER: process.env["TEST_DB_USER"],
    TEST_DB_PWD: process.env["TEST_DB_PWD"],
    TEST_DB_NAME: process.env["TEST_DB_NAME"],
  },
});
