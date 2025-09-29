return {
  "neovim/nvim-lspconfig",
  lazy = false,
  keys = {
    { "K", vim.lsp.buf.hover, desc = "Hover" },
    { "<leader>gd", vim.lsp.buf.definition, desc = "Go definition" },
    { "<leader>gD", vim.lsp.buf.declaration, desc = "Go declaration" },
    { "[d", vim.diagnostic.goto_prev, desc = "Go to previous [D]iagnostic message" },
    { "]d", vim.diagnostic.goto_next, desc = "Go to next [D]iagnostic message" },
    { "<leader>e", vim.diagnostic.open_float, desc = "Show diagnostic [E]rror messages" },
    { "<leader>q", vim.diagnostic.setloclist, desc = "Open diagnostic [Q]uickfix list" },
    { "<leader>gi", vim.lsp.buf.implementation },
    { "<C-s>", vim.lsp.buf.signature_help },
    { "<leader>gr", vim.lsp.buf.references },
    { "<leader>ca", vim.lsp.buf.code_action },
    { "<leader>D", vim.lsp.buf.type_definition },
    { "<leader>rn", vim.lsp.buf.rename },
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("bashls", {
      capabilities = capabilities,
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.config("dprint", {})

    vim.lsp.config("gopls", {
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        gopls = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
      init_options = {
        usePlaceholders = true,
      },
    })

    vim.lsp.config("clangd", {
      capabilities = {
        callHierarchy = {
          dynamicRegistration = false,
        },
        offsetEncoding = { "utf-8", "utf-16" },
        textDocument = {
          codeAction = {
            codeActionLiteralSupport = {
              codeActionKind = {
                valueSet = {
                  "",
                  "Empty",
                  "QuickFix",
                  "Refactor",
                  "RefactorExtract",
                  "RefactorInline",
                  "RefactorRewrite",
                  "Source",
                  "SourceOrganizeImports",
                  "quickfix",
                  "refactor",
                  "refactor.extract",
                  "refactor.inline",
                  "refactor.rewrite",
                  "source",
                  "source.organizeImports",
                },
              },
            },
            dynamicRegistration = false,
          },
          completion = {
            completionItem = {
              commitCharactersSupport = false,
              deprecatedSupport = false,
              documentationFormat = { "markdown", "plaintext" },
              preselectSupport = false,
              snippetSupport = false,
            },
            completionItemKind = {
              valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 },
            },
            contextSupport = false,
            dynamicRegistration = false,
            editsNearCursor = true,
          },
          declaration = {
            linkSupport = true,
          },
          definition = {
            linkSupport = true,
          },
          documentHighlight = {
            dynamicRegistration = false,
          },
          documentSymbol = {
            dynamicRegistration = false,
            hierarchicalDocumentSymbolSupport = true,
            symbolKind = {
              valueSet = {
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
                14,
                15,
                16,
                17,
                18,
                19,
                20,
                21,
                22,
                23,
                24,
                25,
                26,
              },
            },
          },
          hover = {
            contentFormat = { "markdown", "plaintext" },
            dynamicRegistration = false,
          },
          implementation = {
            linkSupport = true,
          },
          publishDiagnostics = {
            relatedInformation = true,
            tagSupport = {
              valueSet = { 1, 2 },
            },
          },
          references = {
            dynamicRegistration = false,
          },
          rename = {
            dynamicRegistration = false,
            prepareSupport = true,
          },
          signatureHelp = {
            dynamicRegistration = false,
            signatureInformation = {
              activeParameterSupport = true,
              documentationFormat = { "markdown", "plaintext" },
              parameterInformation = {
                labelOffsetSupport = true,
              },
            },
          },
          synchronization = {
            didSave = true,
            dynamicRegistration = false,
            willSave = false,
            willSaveWaitUntil = false,
          },
          typeDefinition = {
            linkSupport = true,
          },
        },
        window = {
          showDocument = {
            support = false,
          },
          showMessage = {
            messageActionItem = {
              additionalPropertiesSupport = false,
            },
          },
          workDoneProgress = true,
        },
        workspace = {
          applyEdit = true,
          symbol = {
            dynamicRegistration = false,
            hierarchicalWorkspaceSymbolSupport = true,
            symbolKind = {
              valueSet = {
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
                14,
                15,
                16,
                17,
                18,
                19,
                20,
                21,
                22,
                23,
                24,
                25,
                26,
              },
            },
          },
          workspaceEdit = {
            resourceOperations = { "rename", "create", "delete" },
          },
          workspaceFolders = true,
        },
      },
    })
    vim.lsp.enable("clangd")

    vim.lsp.set_log_level("off")
  end,
}
