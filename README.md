# FileSocket
Alternative to websockets that communicates with files

```lua
local Socket = FileSocket.Connect("Channel")

Socket.OnMessage = function(Message)
    print(Message)
end

Socket:Send("Hello World!") --> Hello, World! (All connected clients)
Socket:Send("Hello World!", {"Bot1", "Bot2"}) --> Hello, World! (Only Bot1 and Bot2's clients)
```
