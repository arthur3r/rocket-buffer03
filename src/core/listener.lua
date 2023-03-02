addCommandHandler("create_account", function (_, username, passowrd, age, email)
  createAccountForUsers(username, passowrd, age, email)
end)

addCommandHandler("login_account", function (_, username, password) 
  signInAccountUsers(username, password)
end)

addCommandHandler("logout_account", function ()
  logoutAccountUsers()
end)

addCommandHandler("data_user", function (_, username) 
  searchDatasUsers(username)
end)

addCommandHandler("buy_vehicle", function (_, nameVehicle, color) 
  buyVehicle(nameVehicle, color)
end)

addCommandHandler("data_vehicles", function (_, username) 
  searchDatasVehicles(username)
end)

addCommandHandler("impost", function (_, username, nameVehicle) 
  impostVehicleUsers(username, nameVehicle)
end)