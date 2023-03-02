local users = {}

local logginAs

--@params:
-- username: string
--@return: boolean
local function existAccountUser(username)
  return table.find(users, function (v) 
    return v.username == username
  end)
end

--@params:
-- username: string
-- password: string
-- age: number
-- email: string
--@return: boolean
function createAccountForUsers(username, password, age, email)
  if (type(username) ~= "string" and type(password) ~= "string" and type(tonumber(age)) ~= "number" and type(email) ~= "string") then
    return false
  end

  local account = existAccountUser(username)
  if (account) then
    return outputChatBox("Este username já esta sendo usado por outra pessoa! Tente outro.")
  end

  table.insert(users, {
    username = username,
    password = password,
    age = tonumber(age),
    email = email,
    vehicles = {}
  })

  outputChatBox("Parabéns " .. username .. " você foi cadastrado com sucesso no nosso banco de dados.")

  return true
end

--@params:
-- username: string
-- password: string
--@return: boolean
function signInAccountUsers(username, password) 
  if (type(username) ~= "string" and type(password) ~= "string") then
    return false
  end

  local account = existAccountUser(username)

  if (not account) then
    return outputChatBox("Esse username não está cadastrado no nosso banco de dados.")
  end

  local userPassword = users[account].password

  if (password ~= userPassword) then
    return false
  end

  if (logginAs == users[account].username) then
    return outputChatBox("Você já está logado nessa conta!")
  end

  logginAs = users[account].username
  outputChatBox("Você foi logado com sucesso.")

  return true
end

--@params:
-- username: string
--@return: boolean
local function deleteAccountUsers(username)
  if (type(username) ~= "string") then
    return false
  end

  local account = existAccountUser(username)

  if (not account) then
    return outputChatBox("Esse username não está cadastrado no nosso banco de dados.")
  end

  users[account] = nil
  logginAs = nil
  return true
end

--@params: none
--@return: boolean
function logoutAccountUsers()
  if (not logginAs) then
    return outputChatBox("Você não esta logado em nenhuma conta.")
  end

  deleteAccountUsers(logginAs)
  outputChatBox("Você foi deslogado da conta.")
  return true
end

--@params:
-- username: string
--@return: boolean
function searchDatasUsers(username)
  if (type(username) ~= "string") then
    return false
  end

  local account = existAccountUser(username)

  if (not account) then
    return outputChatBox("Esse username não está cadastrado no nosso banco de dados.")
  end
  
  local age = users[account].age
  local email = users[account].email

  outputChatBox("Você buscou um dados de usuário chamado: ".. username .. " a idade dele e de: ".. age .. " e o email dele e: ".. email .. ".")
  return true
end

--@params:
-- nameVehicle: string
-- color: string
--@return: boolean
function buyVehicle(nameVehicle, color)
  if (type(nameVehicle) ~= "string" and type(color) ~= "string") then
    return false
  end

  if (not logginAs) then
    return outputChatBox("Você precisa está logado em alguma conta para continuar a compra!")
  end
  

  local account = existAccountUser(logginAs)

  if (not (users[account].age >= 18)) then 
    return outputChatBox("Você precisa ter no minimo 18 anos para prosseguir com a compra!")
  end

  table.insert(users[account].vehicles, {
    nameVehicle = nameVehicle,
    color = color,
  })

  outputChatBox("Compra finalizada com sucesso!")

  return true
end

--@params:
-- username: string
--@return: boolean
function searchDatasVehicles(username)
  if (type(username) ~= "string") then
    return false
  end

  local account = existAccountUser(username)

  if (not account) then
    return outputChatBox("Esse username não está cadastrado no nosso banco de dados.")
  end

  if (#users[account].vehicles < 1) then
    return outputChatBox("Esse usuário não possui nenhum carro!")
  end

  for i, v in ipairs(users[account].vehicles) do
    outputChatBox("O usuário: ".. username .. " possui um(a) ".. v.nameVehicle .. " com a cor: " .. v.color .. ".")
  end
  return true
end

--@params:
-- username: string
-- nameVehicle: string
--@return: number
local function existVehicleUser(username, nameVehicle)
  local account = existAccountUser(username)

  for i, v in ipairs(users[account].vehicles) do
    if (v.nameVehicle == nameVehicle) then
      return i
    end
  end
end

--@params:
-- username: string
-- index: number
--@return: boolean
local function deleteVehicleUsers(username, index)
  if (type(username) ~= "string" and type(index) ~= "number") then
    return false
  end

  local account = existAccountUser(username)

  if (not account) then
    return outputChatBox("Esse username não está cadastrado no nosso banco de dados.")
  end

  table.remove(users[account].vehicles, index)

  return true
end

--@params:
-- username: string
-- nameVehicle: string
--@return: boolean
function impostVehicleUsers(username, nameVehicle)
  if (type(username) ~= "string" and type(nameVehicle) ~= "string") then
    return false
  end

  local account = existAccountUser(username)

  if (not account) then
    return outputChatBox("Esse username não está cadastrado no nosso banco de dados.")
  end

  local existVehicle = existVehicleUser(username, nameVehicle)

  if (not existVehicle) then
    return outputChatBox("O jogador não possui esse veículo!")
  end

  deleteVehicleUsers(username, existVehicle)
  outputChatBox("Você aplicou um imposto no veículo com sucesso!")

  return true
end