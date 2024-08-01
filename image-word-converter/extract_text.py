from PIL import Image
import pytesseract
import fitz

def extract_text(file):
    document = fitz.open(file)
    

    if len(document) < 1:
        raise ValueError("Document is empty")
    
    page = document.load_page(0)

    pix = page.get_pixmap()
    img = Image.frombytes("RGB", [pix.width, pix.height], pix.samples)

    text = pytesseract.image_to_string(img, lang='jpn') 
    # text = pytesseract.image_to_string(img, lang='jpn')

    return text

file = "Screenshot 2024-07-31 at 10.58.26.png"
text = extract_text(file)
print(text)