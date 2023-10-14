return {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
        {
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                table.insert(opts.ensure_installed, "js-debug-adapter")
            end,
            "mxsdev/nvim-dap-vscode-js",
            -- lazy spec to build "microsoft/vscode-js-debug" from source
            {
                "microsoft/vscode-js-debug",
                version = "1.x",
                build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
            },
        },
    },
    opts = function()
        local dap = require("dap")
        local dap_vscode = require("dap-vscode-js")
        dap_vscode.setup({
            debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
            adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
        })

        for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
            dap.configurations[language] = {
                -- attach to a node process that has been started with
                -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
                -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
                {
                    type = "pwa-node",
                    request = "attach",
                    processId = require("dap.utils").pick_process,
                    name = "Attach debugger to existing `node --inspect` process",
                    sourceMaps = true,
                    resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
                    cwd = "${workspaceFolder}/src",
                    skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
                },
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Debug Jest Tests",
                    -- trace = true, -- include debugger info
                    runtimeExecutable = "node",
                    runtimeArgs = {
                        "./node_modules/jest/bin/jest.js",
                        "--runInBand",
                    },
                    rootPath = "${workspaceFolder}",
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                    internalConsoleOptions = "neverOpen",
                },
                {
                    type = "pwa-chrome",
                    name = "Launch Chrome to debug client",
                    request = "launch",
                    url = "http://localhost:3000",
                    sourceMaps = true,
                    protocol = "inspector",
                    port = 9222,
                    webRoot = "${workspaceFolder}/src",
                    -- skip files from vite's hmr
                    skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
                },
                -- only if language is javascript, offer this debug action
                language == "javascript"
                        and {
                            type = "pwa-node",
                            request = "launch",
                            name = "Launch file in new node process",
                            program = "${file}",
                            cwd = "${workspaceFolder}",
                        }
                    or nil,
            }
        end
    end,
}
