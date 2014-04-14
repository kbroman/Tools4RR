#!/usr/bin/env ruby
# modify LaTeX file so that it creates a handout with notes

ifilename = ARGV.length > 0 ? ARGV[0] : "openaccess.tex"
ofilename = ARGV.length > 1 ? ARGV[1] : ifilename.sub(".tex", "_withnotes.tex")

ifile = File.open(ifilename)
ofile = File.open(ofilename, "w")

do_1st_sub = true
do_2nd_sub = true
ifile.readlines.each do |z|
  if do_1st_sub and /\\setbeameroption{hide notes}/ =~ z
    z = z.sub("hide", "show")
    do_1st_sub = false
  end

  if do_2nd_sub and /\\documentclass\[12pt,t\]{beamer}/ =~ z
    z = z.sub("[12pt,t]", "[12pt,t,handout]")
    do_2nd_sub = false
  end

  ofile.write("\\def\\notescolors{1}\n") if /^\\input{/ =~ z # add line saying to use notes colors

  ofile.write(z)
end
