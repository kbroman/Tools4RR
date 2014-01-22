#!/usr/bin/env ruby
#
# fill_flyer.rb
# Karl Broman, 17 Oct 2013
#
#    schedule4web.md flyer_template.tex -> flyer.tex

ifile1 = "schedule.md"
ifile2 = "flyer_template.tex"
ofilen = "flyer.tex"

dates = []
topic = {}
fullline = {}
File.open(ifile1).readlines.map do |line| 
  line.strip
  next unless line =~ /^\*\*(.+)\*\*:\s+(.+)$/
  date = $1
  topictext = $2

  dates.push(date)
  # get rid of markdown-based links
  topictext = topictext.gsub(/\[([^\[\]\(\)]+)\]\([^\[\]\(\)]+\)/, '\1')
  topictext = topictext.gsub(/\&/, "and")
  topictext = topictext.gsub(/\*\*(.*)\*\*/, '\1') # get rid of any bold
  topic[date] = topictext
end

def write_schedule (ofile, dates, topic)
  dates.each do |date|
    ofile.write("#{date} & #{topic[date]} \\\\\n")
  end
end

ofile = File.open(ofilen, "w")
File.open(ifile2).readlines.each do |line| 
  if line =~ /PUT_SCHEDULE_HERE/
    write_schedule(ofile, dates, topic)
  else
    ofile.write(line)
  end
end
