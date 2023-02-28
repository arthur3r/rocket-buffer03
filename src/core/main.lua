local users = {}

function existAccountUser(username)
  return table.find(users, function (v) 
    return v.username == username
  end)
end

function createAccountForUsers(username, password, age, email)
  if (type(username) ~= "string" and type(password) ~= "string" and type(age) ~= "string" and type(email) ~= "string") then
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
    isLoggin = false,
    vehicles = {}
  })

  return outputChatBox("Parabéns " .. username .. " você foi cadastrado com sucesso no nosso banco de dados.")
end

function signInAccountUsers(username, password) 
  if (type(username) ~= "string" or type(password) ~= "string") then
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

  if (users[account].isLoggin) then
    return outputChatBox("Você já está logado nessa conta!")
  end


  outputChatBox("Você foi logado com sucesso.")
  users[account].isLoggin = true
  return
end

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

  return outputChatBox("Você buscou um dados de usuário chamado: ".. username .. " a idade dele e de: ".. age .. " e o email dele e: ".. email .. ".")
end

function buyVehicle(username, nameVehicle, color)
  if (type(username) ~= "string" and type(nameVehicle) ~= "string" and type(color) ~= "string") then
    return false
  end

  local account = existAccountUser(username)

  if (not account) then
    return outputChatBox("Esse username não está cadastrado no nosso banco de dados.")
  end

  if (not users[account].isLoggin) then
    return outputChatBox("Você precisa está logado em alguma conta para continuar a compra!")
  end

  if (not (users[account].age >= 18)) then 
    return outputChatBox("Você precisa ter no minimo 18 anos para prosseguir com a compra!")
  end

  table.insert(users[account].vehicles, {
    nameVehicle = nameVehicle,
    color = color
  })

  return outputChatBox("Compra finalizada com sucesso!")
end

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
end