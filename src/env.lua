local env = "prod"

function setEnv()
  if env == "debug" or env == "dev" then
    if pcall(require, "lldebugger") then 
      require("lldebugger").start() 
    end
    if pcall(require, "mobdebug") then 
      require("mobdebug").start() 
    end
  end
end

setEnv()