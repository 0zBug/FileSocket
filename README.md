# FileSocket
**Alternative to websockets that communicates with files**
# Documentation
### Connect
**Connects to the channel specified**
```html
<Object> FileSocket:Connect(<string> Channel)
```
### Send
**Sends the message to all clients or clients in the table**
```html
<void> Socket:Send(<string> Message, <table> Clients)
```
### Close
**Deletes the channel and fire OnClose**
```html
<void> Socket:Close(<void>)
```
### OnMessage
**Fired when a message is sent in the connected channel**
```html
<void> Socket.OnMessage:Connect(function(<string> Message))
```
### OnClose
**Fired when the Close function is called**
```html
<void> Socket.OnClose = function(<void>)
```
# Example
```lua
local Socket = FileSocket.Connect("Channel")

Socket.OnMessage:Connect(function(Message)
    print(Message)
end)

Socket:Send("Hello, World!") --> Hello, World! (All connected clients)
Socket:Send("Hello, World!", {"Bot1", "Bot2"}) --> Hello, World! (Only Bot1 and Bot2's clients)
```
