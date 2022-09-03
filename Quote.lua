function Initialize()
   html = dofile('htmlEntities/src/htmlEntities.lua')
   json = dofile('dkjson.lua')
end -->Initialize

function Update()
   now = os.date('%H_%M.json')

   time = "time"
   quote_first = "quote_first"
   quote_time_case = "quote_time_case"
   quote_last = "quote_last"
   title = "title"
   author = "author"

   path = io.popen("cd"):read()
   file = io.open(path..'/times/times/'..now, "r")
   
   if file then
      content = file:read "*a"
      file:close()
      myTable = json.decode(content)

      repeat
         rand = math.random(1, #myTable)
      until (myTable[rand]["sfw"]=="yes")

      quote = myTable[rand][quote_first]..myTable[rand][quote_time_case]..myTable[rand][quote_last]
      bookauthor = myTable[rand][title]..", "..myTable[rand][author]
      quote = html.decode(quote)
      quote = quote:gsub('<br>','\n')
   else
      quote = os.date('%H:%M')
      bookauthor = ""
   end
   
   SKIN:Bang('!SetOption', 'MeterQuote', 'Text', quote)
   SKIN:Bang('!SetOption', 'MeterAuthor', 'Text', bookauthor)
   
   return
   
end -->Update
