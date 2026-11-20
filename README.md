### Example
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/sugengcihuy/SugengLibrary/main/ExampleTest.lua"))()
```

### Custom Key
```lua
local win = SugengLib:CreateWindow({
    Title = "Sugeng Hub",
    KeySystem = true,
    KeyValidator = function(inputKey)
        local onlineKey = game:HttpGet("https://raw.githubusercontent.com/.../keys.txt")
        return string.find(onlineKey, inputKey) ~= nil
    end
})
```
