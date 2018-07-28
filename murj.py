import sys
import PyPDF2

data = []
for line in sys.argv:
    data.append(line)
data = data[1:]

num_input = int(data[0])
num_output = int(data[1])

data = data[2:]

input_files = []
for i in range(0, num_input):
    input_files.append(data[i])

data = data[num_input:]

output_files = []
for i in range(0, num_output):
    output_files.append(data[i])

merger = PyPDF2.PdfFileMerger()

for i in input_files:
    try:
        file = open(i, "rb")
    except IOError:
        print("Could not find file " + i)
        sys.exit()
    except IOError:
            print("Could not read file " + i)
            sys.exit()
    merger.append(fileobj = file, bookmark = i)

for o in output_files:
    output = open(o, "wb")
    merger.write(output)

print(str(num_input) + " files successfully merged")
