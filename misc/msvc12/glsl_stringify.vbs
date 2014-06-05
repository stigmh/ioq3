Dim fso, infilePath, outfilePath, infile, outfile, line

if WScript.Arguments.Count < 2 then
    WScript.Echo "Missing parameters"
    WScript.Quit 1
end if

infilePath = WScript.Arguments(WScript.Arguments.Count - 2)
outfilePath = WScript.Arguments(WScript.Arguments.Count - 1)

Set fso = CreateObject("Scripting.FileSystemObject")
Set infile = fso.OpenTextFile(infilePath)
Set outfile = fso.CreateTextFile(outfilePath, True)

WScript.Echo "Path of input file: " & infilePath
WScript.Echo "Path of output file: " & outfilePath

outfile.WriteLine("const char *fallbackShader_" & fso.GetBaseName(infilePath) & " =")
While Not infile.AtEndOfStream
	line = infile.ReadLine
	line = Replace(line, "\", "\\")
	line = Replace(line, Chr(9), "\t")
	line = Replace(line, Chr(34), "\" & chr(34))
	line = Chr(34) & line & "\n" & Chr(34)
	outfile.WriteLine(line)
Wend
outfile.WriteLine(";")

infile.Close
outfile.Close