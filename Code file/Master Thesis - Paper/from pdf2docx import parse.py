from pdf2docx import parse

# path of pdf file
pdf_file = 'test--1-.pdf'

# will create .docx in same path
docx_file = 'test--1-.docx'

# Here is where we convert pdf to docx
parse(pdf_file, docx_file, start=0, end=None)