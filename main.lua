
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

local FileSocket = {}

function FileSocket.Connect(Channel)
    local Channel = "Mail/" .. Channel .. "/"
    local MailBox = Channel .. LocalPlayer.Name

    if not isfolder("Mail") then makefolder("Mail") end
    if not isfolder(Channel) then makefolder(Channel) end
    if not isfolder(MailBox) then makefolder(MailBox) end
    
    local Socket = {
        Send = function(self, Message, Bots)
            if Bots and #Bots > 0 then    
                for _, Bot in next, Bots do
                    if not isfolder("Mail/" .. Bot) then
                        warn(string.format("%s not found on network.", Bot))
                    end
        
                    writefile(Channel .. Bot .. "/" .. HttpService:GenerateGUID(false) .. ".mail", Message)
                end
            else
                for _, Bot in pairs(listfiles("Mail")) do
                    writefile(Channel .. string.sub(Bot, #Channel, #Bot) .. "/" .. HttpService:GenerateGUID(false) .. ".mail", Message)
                end
            end
        end,
        Close = function(self)
            self.OnClose()

            delfile(Channel)
        end,
        OnMessage = function(Message) end,
        OnClose = function() end
    }

    RunService.RenderStepped:Connect(function()
        for _, Mail in pairs(listfiles(MailBox)) do
            Socket.OnMessage(readfile(Mail))

            delfile(Mail)
        end
    end)

    return Socket
end

return FileSocket
