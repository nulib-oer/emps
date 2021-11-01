-- turn fenced div elements with 'question' class into accordion-style drop down
-- adapted from https://github.com/ukgovdatascience/govdown/blob/master/inst/rmarkdown/resources/govuk.lua

local List = require 'pandoc.List'

function Div(el)
  v,i = el.classes:find("question")
  if i ~= nil then
    el.classes[i] = nil
    
    local html
    local res = List:new{}
    
    html =
      '<details>' ..
      '<summary>' ..
      el.attributes["text"] ..
      '</summary>' 
      
    table.insert(res, pandoc.RawBlock('html', html))
    
    for _, block in ipairs(el.content) do
      table.insert(res, block)
    end
    table.insert(res, pandoc.RawBlock('html', '</details>'))
    
  return res
  end
end