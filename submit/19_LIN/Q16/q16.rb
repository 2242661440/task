require 'open-uri'
 

 def  mission
   
   puts 'urlを入力してください'

   path = gets.to_s

   data = open(path, &:read)

   get_title(data)
   puts ""
   
   get_content(data)
   puts ""
   
   get_time(data)

 end

 def get_title(data)
   title = data.scan(%r!<h1 class=".+">(.+?)<\/h1>!)
   puts "title：#{title[0][0]}"
 end

 def get_time(data)
   title = data.scan(%r!"updated_at":"(\d{4}-\d{2}-\d{2})T!)
   puts "time：#{title[0][0]}"
 end

 def get_content(data)
   title = data.scan(%r!<p class="Paragraph.+?">(.+?)<\/p>!)
   print 'text: '
   title.each { |i| puts i }
 end



  mission
