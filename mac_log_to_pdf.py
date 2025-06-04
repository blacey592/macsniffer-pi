from fpdf import FPDF
import os
import datetime

pdf = FPDF()
pdf.add_page()
pdf.set_font("Arial", size=12)

log_dir = "/logs/"
for log_file in os.listdir(log_dir):
    if log_file.endswith(".log"):
        with open(os.path.join(log_dir, log_file), "r") as f:
            lines = f.readlines()
        pdf.cell(200, 10, txt=f"MAC Log File: {log_file}", ln=True)
        for line in lines:
            pdf.cell(200, 8, txt=line.strip(), ln=True)

timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M")
pdf.output(f"/output/mac_log_{timestamp}.pdf")
