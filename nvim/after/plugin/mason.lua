local present, mason = pcall(require, "mason")

if not present then
    return
end

local options = {
    ensure_installed = {
        "bash-language-server",
        "black",
        "clang-format",
        "clangd",
        "cmake-language-server",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "efm",
        "eslint-lsp",
        "gersemi",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "prettier",
        "pyright",
        "shfmt",
        "sql-formatter",
        "sqlls",
        "terraform-ls",
        "typescript-language-server",
        "vim-language-server",
        "yaml-language-server",
    },
    max_concurrent_installers = 10,
}

mason.setup(options)

vim.api.nvim_create_user_command("MasonInstallAll", function()
    vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})
