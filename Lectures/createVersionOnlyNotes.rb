#!/usr/bin/env ruby
# modify LaTeX file so that it creates a handout with notes

ifilename = ARGV.length > 0 ? ARGV[0] : "openaccess.tex"
ofilename = ARGV.length > 1 ? ARGV[1] : ifilename.sub(".tex", "_onlynotes.tex")

ifile = File.open(ifilename)
ofile = File.open(ofilename, "w")

ifile.readlines.each do |z|
  z = z.sub("hide", "show only") if /\\setbeameroption{hide notes}/ =~ z
  ofile.write(z)
end
