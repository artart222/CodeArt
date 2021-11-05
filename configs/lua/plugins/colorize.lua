local present, color = pcall(require, "colorizer")
if not present then
  return
end

color.setup {
  "*",
  css = { rgb_fn = true; }
}
