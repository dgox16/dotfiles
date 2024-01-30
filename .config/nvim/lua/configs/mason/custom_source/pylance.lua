local Pkg = require("mason-core.package")
local path = require("mason-core.path")

local function installer(ctx)
    local script = [[
    curl -s -c cookies.txt 'https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance' > /dev/null &&
    curl -s "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/vscode-pylance/latest/vspackage"
         -j -b cookies.txt --compressed --output "pylance.vsix"
  ]]
    ctx.receipt:with_primary_source(ctx.receipt.unmanaged)
    ctx.spawn.bash({ "-c", script:gsub("\n", " ") })
    ctx.spawn.unzip({ "pylance.vsix" })
    ctx.spawn.bash({
        "-c",
        [[
      awk 'BEGIN{RS=ORS=";"} /if\(!process/ && !found {sub(/return!0x1/, "return!0x0"); found=1} 1' extension/dist/server.bundle.js |
      awk 'BEGIN{RS=ORS=";"} /throw new/ && !found {sub(/throw new/, ""); found=1} 1' > extension/dist/server_nvim.js
    ]],
    })
    ctx:link_bin(
        "pylance",
        ctx:write_node_exec_wrapper("pylance", path.concat({ "extension", "dist", "server_nvim.js" }))
    )
end

return Pkg.new({
    name = "pylance",
    desc = [[Fast, feature-rich language support for Python]],
    homepage = "https://github.com/microsoft/pylance",
    languages = { Pkg.Lang.Python },
    categories = { Pkg.Cat.LSP },
    install = installer,
})
