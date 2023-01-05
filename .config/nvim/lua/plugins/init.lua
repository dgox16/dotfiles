local status, plugins = pcall(require, "plugins.packerList")

if not status then
    print("Error in plugin list")
    plugins = {}
end

require("plugins.packerInit").run(plugins)
