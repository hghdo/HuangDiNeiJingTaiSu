# encoding: utf-8
f = File.open('taisu_utf8.html', 'r')
nf = File.open('zhengli.html','w+')
fine = ''
count = 0
f.readlines.each do |l|
  # break if count>1000
  # count+=1
  fine+=l.gsub(/\s$/,'')
  if l=~/>\s$/
    fine.gsub!('spanstyle', 'span style')
    fine.gsub!('lang=EN-US','')
    fine.gsub!(/<span\s?>“<\/span>/,'“')
    fine.gsub!(/<span\s?>”<\/span>/,'”')
    fine.gsub!('class=MsoNormal','')
    if fine.include?('黑体')
      fine.gsub!('<p','<h5')
      fine.gsub!('/p>',"/h5>")
    end
    fine.gsub!(/style='.*?'/,'')
    nf.puts(fine)
    fine=''
  end
end

f.close
nf.close