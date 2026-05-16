import { APIError } from "openai";

export type OpenAiErrorDetails = {
  status: number | undefined;
  message: string;
  requestId: string | null | undefined;
  code: string | null | undefined;
  type: string | undefined;
  param: string | null | undefined;
  body: unknown;
};

export function extractOpenAiErrorDetails(err: unknown): OpenAiErrorDetails | null {
  if (!(err instanceof APIError)) return null;
  return {
    status: err.status,
    message: err.message,
    requestId: err.requestID,
    code: err.code ?? undefined,
    type: err.type,
    param: err.param ?? undefined,
    body: err.error,
  };
}

export function exposeOpenAiErrorDetailsInResponse(): boolean {
  if (process.env.OPENAI_DEBUG_ERRORS?.trim().toLowerCase() === "true") return true;
  return process.env.NODE_ENV === "development";
}
