local options = {
  "options.common",
}

for _, option in ipairs(options) do
  local ok, module = pcall(require, option)
  if ok then
    module.setup()
  end
end
