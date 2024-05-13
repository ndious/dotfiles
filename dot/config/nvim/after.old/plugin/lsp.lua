local status, lsp = pcall(require, 'lsp-zero')
local status_cmp, cmp = pcall(require, 'cmp')
local status_ndev, ndev = pcall(require, 'neodev')

if (not status or not status_cmp) then
    print 'lsp-plugin is missing please run :PackerSync'
    return
end

if (status_ndev) then
    ndev.setup({})
end

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'cssls',
    'rust_analyzer',
    'gopls',
})

lsp.configure('lua-language-server', {
    settings = {
        lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mapping
})

lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}

  --[[ Need to change _ by client in function parameter
  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end
  ]]--

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

