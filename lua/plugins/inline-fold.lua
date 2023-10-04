local tsx = {
  { pattern = 'className="([^"]*)"' }, -- classes in html
}

local jsx = tsx

return {
  "malbertzard/inline-fold.nvim",
  opts = {
    defaultPlaceholder = "…",
    queries = {
      html = {
        { pattern = 'class="([^"]*)"' }, -- classes in html
        { pattern = 'className="([^"]*)"' }, -- classes in html
        { pattern = 'href="(.-)"' }, -- hrefs in html
        { pattern = 'src="(.-)"' }, -- HTML img src attribute
      },
      typescriptreact = tsx,
      javascriptreact = jsx,
    },
  },
}
