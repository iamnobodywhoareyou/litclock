function Initialize()

   path = SKIN:GetVariable('CURRENTPATH')
   json = dofile(path..'dkjson.lua')
   html = dofile(path..'htmlEntities/src/htmlEntities.lua')
   
end -->Initialize

function Update()
   now = os.date('%H_%M.json')
   file = io.open(path..'times/'..now, "rb")

   if file then
      content = file:read "*a"
      file:close()
      info = json.decode(content)

      repeat
         rand = math.random(1, #info)
      until(info[rand]["sfw"] == "yes")
      
      quote = info[rand]["quote_first"]..info[rand]["quote_time_case"]..info[rand]["quote_last"]
      author = info[rand]["title"]..", "..info[rand]["author"]
      
      quote = html.decode(quote)

   else
      quote = os.date('%H:%M')
      author = ""
   end

   SKIN:Bang('!SetOption', 'MeterQuote', 'Text', quote)
   SKIN:Bang('!SetOption', 'MeterAuthor', 'Text', author)
   
   return
   
end -->Update