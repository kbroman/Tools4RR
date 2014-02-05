#!/usr/bin/env ruby
# modify LaTeX file so that it creates a handout with notes

ifilename = ARGV.length > 0 ? ARGV[0] : "openaccess.tex"
ofilename = ARGV.length > 1 ? ARGV[1] : ifilename.sub(".tex", "_withnotes.tex")

ifile = File.open(ifilename)
ofile = File.open(ofilename, "w")

ifile.readlines.each do |z|
  z = z.sub("hide", "show") if /\\setbeameroption{hide notes}/ =~ z
  z = z.sub("[12pt,t]", "[12pt,t,handout]") if /\\documentclass\[12pt,t\]{beamer}/ =~ z
  ofile.write(z)
end
