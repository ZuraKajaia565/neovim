-- ~/.config/nvim/lua/custom/plugins/java.lua

return {
  {
    'mfussenegger/nvim-jdtls',
    config = function()
      local jdtls_path = vim.fn.stdpath 'data' .. '/mason/packages/jdtls'
      local path_to_lsp_server = jdtls_path .. '/config_linux' -- Adjust for your OS
      local path_to_plugins = jdtls_path .. '/plugins/'
      local path_to_jar = vim.fn.glob(path_to_plugins .. 'org.eclipse.equinox.launcher_*.jar')

      local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
      local root_dir = require('jdtls.setup').find_root(root_markers)
      local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
      local workspace_dir = vim.fn.stdpath 'data' .. '/site/java/workspace-root/' .. project_name
      vim.fn.mkdir(workspace_dir, 'p')

      local config = {
        cmd = {
          'java',
          '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          '-Dosgi.bundles.defaultStartLevel=4',
          '-Declipse.product=org.eclipse.jdt.ls.core.product',
          '-Dlog.protocol=true',
          '-Dlog.level=ALL',
          '-Xms1g',
          '--add-modules=ALL-SYSTEM',
          '--add-opens',
          'java.base/java.util=ALL-UNNAMED',
          '--add-opens',
          'java.base/java.lang=ALL-UNNAMED',
          '-jar',
          path_to_jar,
          '-configuration',
          path_to_lsp_server,
          '-data',
          workspace_dir,
        },
        root_dir = root_dir,
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = 'JavaSE-23',
                  path = '/usr/lib/jvm/java-23-openjdk', -- Adjust to your JDK path
                },
              },
            },
          },
        },
      }

      require('jdtls').start_or_attach(config)
    end,
  },
}
