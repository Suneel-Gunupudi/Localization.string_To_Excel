require 'write_xlsx'

# Create a new Excel workbook
workbook = WriteXLSX.new('ruby.xlsx')

# Add a worksheet
worksheet = workbook.add_worksheet

#  Add and define a format
format = workbook.add_format
format.set_bold
format.set_color('red')
format.set_align('center')

# Write a formatted and unformatted string, row and column notation.
col = row = 0
worksheet.write(row, col, 'Hi Excel!', format)
worksheet.write(1, col, 'Hi Excel!')

# Write a number and a formula using A1 notation
worksheet.write('A3', 1.2345 )
worksheet.write('A4', '=SIN(PI()/4)')

# file = File.open("DSLocalization.txt")
# file_data = file.read

#line.gsub("\"","\\\"").split('||')

excelRow = 0
File.foreach("Localization.strings") do |line| 
	templin = line.gsub("\"","")

	templin = templin.gsub(";","")
	templin = templin.gsub("\n","")
	# templin = templin.gsub(" ","")
	rowInfo = templin.split('=')
	
	mainString = rowInfo[0]
	transulateString = rowInfo[1]

	worksheet.write(excelRow, 0, mainString)
	worksheet.write(excelRow, 1, transulateString)

	excelRow = excelRow + 1
	# puts templin

end


# Write xlsx file to disk.
workbook.close
