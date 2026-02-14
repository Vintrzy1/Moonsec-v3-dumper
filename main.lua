local old = unpack
local old_append = appendfile 

local output = "yes.txt"

local Credits = "\n"..[[

          _____                   _______                   _____           _______                   _____                    _____                    _____          
         /\    \                 /::\    \                 /\    \         /::\    \                 /\    \                  /\    \                  /\    \         
        /::\    \               /::::\    \               /::\____\       /::::\    \               /::\    \                /::\    \                /::\____\        
       /::::\    \             /::::::\    \             /:::/    /      /::::::\    \             /::::\    \              /::::\    \              /:::/    /        
      /::::::\    \           /::::::::\    \           /:::/    /      /::::::::\    \           /::::::\    \            /::::::\    \            /:::/    /         
     /:::/\:::\    \         /:::/~~\:::\    \         /:::/    /      /:::/~~\:::\    \         /:::/\:::\    \          /:::/\:::\    \          /:::/    /          
    /:::/__\:::\    \       /:::/    \:::\    \       /:::/    /      /:::/    \:::\    \       /:::/  \:::\    \        /:::/__\:::\    \        /:::/____/           
    \:::\   \:::\    \     /:::/    / \:::\    \     /:::/    /      /:::/    / \:::\    \     /:::/    \:::\    \      /::::\   \:::\    \       |::|    |            
  ___\:::\   \:::\    \   /:::/____/   \:::\____\   /:::/    /      /:::/____/   \:::\____\   /:::/    / \:::\    \    /::::::\   \:::\    \      |::|    |     _____  
 /\   \:::\   \:::\    \ |:::|    |     |:::|    | /:::/    /      |:::|    |     |:::|    | /:::/    /   \:::\ ___\  /:::/\:::\   \:::\    \     |::|    |    /\    \ 
/::\   \:::\   \:::\____\|:::|____|     |:::|    |/:::/____/       |:::|____|     |:::|    |/:::/____/     \:::|    |/:::/__\:::\   \:::\____\    |::|    |   /::\____\
\:::\   \:::\   \::/    / \:::\    \   /:::/    / \:::\    \        \:::\    \   /:::/    / \:::\    \     /:::|____|\:::\   \:::\   \::/    /    |::|    |  /:::/    /
 \:::\   \:::\   \/____/   \:::\    \ /:::/    /   \:::\    \        \:::\    \ /:::/    /   \:::\    \   /:::/    /  \:::\   \:::\   \/____/     |::|    | /:::/    / 
  \:::\   \:::\    \        \:::\    /:::/    /     \:::\    \        \:::\    /:::/    /     \:::\    \ /:::/    /    \:::\   \:::\    \         |::|____|/:::/    /  
   \:::\   \:::\____\        \:::\__/:::/    /       \:::\    \        \:::\__/:::/    /       \:::\    /:::/    /      \:::\   \:::\____\        |:::::::::::/    /   
    \:::\  /:::/    /         \::::::::/    /         \:::\    \        \::::::::/    /         \:::\  /:::/    /        \:::\   \::/    /        \::::::::::/____/    
     \:::\/:::/    /           \::::::/    /           \:::\    \        \::::::/    /           \:::\/:::/    /          \:::\   \/____/          ~~~~~~~~~~          
      \::::::/    /             \::::/    /             \:::\    \        \::::/    /             \::::::/    /            \:::\    \                                  
       \::::/    /               \::/____/               \:::\____\        \::/____/               \::::/    /              \:::\____\                                 
        \::/    /                 ~~                      \::/    /         ~~                      \::/____/                \::/    /                                 
         \/____/                                           \/____/                                   ~~                       \/____/                                  
                                                                                                                                           
                                                                    Moonsec V3 Dumper made by Solodev
]]
         


-- [[ VILATIP ONLINE KEY SYSTEM ]]
-- Mengecek password langsung dari internet (Pastebin)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

-- 1. KONFIGURASI (LINK KAMU)
local URL_PASSWORD_ASLI = "https://pastebin.com/raw/ATsZH3j6" -- Link Password (Isinya text key)
local LINK_DISCORD      = "https://discord.gg/b8TMJaRY"        -- Link Get Key
local SCRIPT_TUJUAN     = "https://pastebin.com/raw/PnE9dTQV"  -- Script Hub Kamu

-- 2. SETUP UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VilatipKeySystem"
if gethui then
    ScreenGui.Parent = gethui()
elseif CoreGui then
    ScreenGui.Parent = CoreGui
else
    ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -100)
MainFrame.Size = UDim2.new(0, 320, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

-- Header
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.GothamBlack
Title.Text = "🔒 COPY MAP by vilatip Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

-- Status Text
local Status = Instance.new("TextLabel")
Status.Parent = MainFrame
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0, 0, 0.85, 0)
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Font = Enum.Font.Gotham
Status.Text = "Status: Menunggu Input..."
Status.TextColor3 = Color3.fromRGB(150, 150, 150)
Status.TextSize = 12

-- Input Box
local KeyInput = Instance.new("TextBox")
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
KeyInput.Position = UDim2.new(0.1, 0, 0.25, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Font = Enum.Font.GothamBold
KeyInput.PlaceholderText = "Masukkan Key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 6)

-- Tombol Cek (Login)
local LoginBtn = Instance.new("TextButton")
LoginBtn.Parent = MainFrame
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100) -- Hijau
LoginBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
LoginBtn.Size = UDim2.new(0.8, 0, 0, 35)
LoginBtn.Font = Enum.Font.GothamBlack
LoginBtn.Text = "CHECK KEY / LOGIN"
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.TextSize = 14
Instance.new("UICorner", LoginBtn).CornerRadius = UDim.new(0, 6)

-- Tombol Get Key (Discord)
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Parent = MainFrame
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242) -- Warna Discord
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 25)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Text = "GET KEY (DISCORD)"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.TextSize = 12
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 6)

-- 3. LOGIKA UTAMA

-- Fungsi Ambil Link Discord
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(LINK_DISCORD)
    GetKeyBtn.Text = "LINK DISCORD DISALIN!"
    task.wait(2)
    GetKeyBtn.Text = "GET KEY (DISCORD)"
end)

-- Fungsi Cek Password
LoginBtn.MouseButton1Click:Connect(function()
    Status.Text = "Status: Mengecek ke Server..."
    LoginBtn.Text = "MEMERIKSA..."
    
    -- Ambil data dari Pastebin (Raw)
    local Success, Result = pcall(function()
        return game:HttpGet(URL_PASSWORD_ASLI)
    end)
    
    if Success then
        -- Bersihkan spasi/enter yang tidak perlu
        local KeyServer = string.gsub(Result, "^%s*(.-)%s*$", "%1") -- Trim spasi
        local KeyInputUser = string.gsub(KeyInput.Text, "^%s*(.-)%s*$", "%1")
        
        if KeyInputUser == KeyServer then
            -- BERHASIL
            LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            LoginBtn.Text = "SUKSES! MEMUAT..."
            Status.Text = "Status: Key Benar!"
            task.wait(1)
            
            ScreenGui:Destroy() -- Hapus UI Key
            loadstring(game:HttpGet(SCRIPT_TUJUAN))() -- Load Script Hub
        else
            -- PASSWORD SALAH
            LoginBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            LoginBtn.Text = "KEY SALAH!"
            Status.Text = "Status: Key tidak cocok."
            task.wait(1)
            LoginBtn.Text = "CHECK KEY / LOGIN"
            LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        end
    else
        -- ERROR KONEKSI
        Status.Text = "Status: Gagal konek ke Pastebin!"
        LoginBtn.Text = "ERROR JARINGAN"
        task.wait(2)
        LoginBtn.Text = "CHECK KEY / LOGIN"
    end
end)


--[[ Script ]]-- 

--> Put your obfuscated script here nigga 
--> Using tbo as an example : It will freeze your game for a bit and then create a file named after your output
--> then it will basically just put all the stuff in there, just wait for it to be done

--> either loadstring or just the pasted script here 
--> btw dont use tbo its skidded lmao 

loadstring(game:HttpGet("https://raw.githubusercontent.com/cool5013/TBO/refs/heads/main/paid"))()
