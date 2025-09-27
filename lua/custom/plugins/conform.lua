return {
  {
    "stevearc/conform.nvim",
    config = function()
      local path_utils = require "utils.path"

      -- Helper function to choose formatter based on project
      local function get_js_formatter()
        local cwd = vim.fn.getcwd()
        -- Use Biome if biome.json exists
        if vim.fn.filereadable(cwd .. "/biome.json") == 1 then
          return { "biome" }
          -- Use Prettier if .prettierrc exists
        elseif vim.fn.filereadable(cwd .. "/.prettierrc") == 1 or
            vim.fn.filereadable(cwd .. "/.prettierrc.json") == 1 or
            vim.fn.filereadable(cwd .. "/prettier.config.js") == 1 then
          return { "prettierd", "prettier" }
          -- Default to Biome
        else
          return { "biome" }
        end
      end

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt" },
          -- Option 2: Use conditional formatter
          javascript = get_js_formatter,
          javascriptreact = get_js_formatter,
          typescript = get_js_formatter,
          typescriptreact = get_js_formatter,
          json = { "biome" },
          jsonc = { "biome" },
          markdown = { "prettierd", "prettier" },
          css = { "prettierd", "prettier" },
          html = { "prettierd", "prettier" },
          yaml = { "prettierd", "prettier" },
          scss = { "prettierd", "prettier" },
        },
      }
      -- format on save (only outside developatic dir)
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          if not path_utils.is_developatic_dir() then
            require("conform").format {
              bufnr = args.buf,
              lsp_fallback = true,
            }
          end
        end,
      })
      -- manual format
      vim.keymap.set("n", "<leader>f", function()
        require("conform").format { async = true, lsp_fallback = true }
      end, { desc = "Format file with Conform" })

      -- Format with Biome specifically
      vim.keymap.set("n", "<leader>fb", function()
        require("conform").format {
          formatters = { "biome" },
          async = true
        }
      end, { desc = "Format with Biome" })

      -- Format with Prettier specifically
      vim.keymap.set("n", "<leader>fp", function()
        require("conform").format {
          formatters = { "prettierd" },
          async = true
        }
      end, { desc = "Format with Prettier" })
    end,
  },
}
