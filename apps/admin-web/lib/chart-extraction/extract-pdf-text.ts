import pdfParse from 'pdf-parse';

export async function extractPdfText(buffer: Buffer): Promise<{ text: string; numPages: number }> {
  const data = await pdfParse(buffer);
  const text = typeof data.text === 'string' ? data.text.trim() : '';
  return { text, numPages: data.numpages };
}
