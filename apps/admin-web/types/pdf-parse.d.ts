declare module 'pdf-parse' {
  function pdfParse(
    data: Buffer,
    options?: unknown,
  ): Promise<{ numpages: number; text: string; [key: string]: unknown }>;
  export = pdfParse;
}
