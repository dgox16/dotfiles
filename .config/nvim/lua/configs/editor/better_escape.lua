local present, escape = pcall(require, "better_escape")
if not present then
    return
end

escape.setup({ mapping = { "jk" } })
