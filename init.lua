
function _G.put(...)
   local objects = {}
   for i = 1, select('#', ...) do
      local v = select(i, ...)
      table.insert(objects, vim.inspect(v))
   end

   print(table.concat(objects, '\n'))
   return ...
end

function get_hl(name)
   local ok, hl = pcall(vim.api.nvim_get_hl_by_name, name, true)
   if not ok then
      return
   end
   for _, key in pairs({"foreground", "background", "special"}) do
      if hl[key] then
         hl[key] = string.format("#%06x", hl[key])
      end
   end
   return hl

end
