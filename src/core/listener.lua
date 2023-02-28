addCommandHandler("create_account", function (_, username, passowrd, age, email)
  createAccountForUsers(username, passowrd, age, email)
end)

addCommandHandler("login_account", function (_, username, password) 
  signInAccountUsers(username, password)
end)

addCommandHandler("data_user", function (_, username) 
  searchUsers(username)
end)

addCommandHandler("buy_vehicle", function (_, username, nameVehicle, color) 
  buyVehicle(username, nameVehicle, color)
end)

addCommandHandler("data_vehicle", function (_, username) 
  searchDatasVehicles(username)
end)