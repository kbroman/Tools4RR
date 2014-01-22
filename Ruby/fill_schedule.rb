#!/usr/bin/env ruby
#
# fill_schedule.rb
# Karl Broman, 17 Oct 2013
#
#    schedule4web.md schedule_template.md -> schedule.md

ifile1 = "schedule4web.md"
ifile2 = "schedule_template.md"
ofilen = "schedule.md"

dates = []
topic = {}
fullline = {}
File.open(ifile1).readlines.map do |line| 
  line.strip
  next unless line =~ /^\*\*(.+)\*\*:\s+(.+)$/
  dates.push($1)
  topic[$1] = $2
  fullline[$1] = line
end

def write_schedule (ofile, dates, fullline)
  dates.each do |date|
    ofile.write(fullline[date])
  end
end

ofile = File.open(ofilen, "w")
File.open(ifile2).readlines.each do |line| 
  if line =~ /PUT_SCHEDULE_HERE/
    write_schedule(ofile, dates, fullline)
  else
    ofile.write(line)
  end
end
