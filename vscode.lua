-- Cursor / VS Code Neovim mappings ported from .ideavimrc
-- Loaded only when vim.g.vscode is set (see init.lua).

local vscode = require('vscode')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function action(command)
  return function()
    vscode.action(command)
  end
end

local function with_insert(command)
  return function()
    vscode.with_insert(function()
      vscode.action(command)
    end)
  end
end

-- Don't use Ex mode, use Q for formatting.
vim.keymap.set('', 'Q', 'gq')

-- Recenter after half-page scroll
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

--[[ Navigation ]]
vim.keymap.set('n', '<leader>f', action('editor.action.goToReferences'))
vim.keymap.set('n', '<leader>g', action('editor.action.revealDefinition'))
vim.keymap.set('n', '<S-Space>', action('editor.action.marker.next'))

-- Tab / editor group moves (approximate IdeaVim splitter actions)
vim.keymap.set('n', '<leader><Right>', action('workbench.action.moveEditorToNextGroup'))
vim.keymap.set('n', '<leader><Left>', action('workbench.action.moveEditorToPreviousGroup'))
vim.keymap.set('n', '<leader><leader><Right>', action('workbench.action.focusNextGroup'))
vim.keymap.set('n', '<leader><leader><Left>', action('workbench.action.focusPreviousGroup'))

--[[ Editing ]]
vim.keymap.set('n', '<leader>e', action('editor.unfold'))
vim.keymap.set('n', '<leader><leader>e', action('editor.unfoldAll'))
vim.keymap.set('n', '<leader>c', action('editor.fold'))
vim.keymap.set('n', '<leader><leader>c', action('editor.foldAll'))
vim.keymap.set('n', '<leader>s', action('editor.action.showHover'))

--[[ Refactoring ]]
vim.keymap.set('n', '<leader>m', with_insert('editor.action.refactor'))
vim.keymap.set('n', '<leader>r', with_insert('editor.action.rename'))
vim.keymap.set('n', '<leader>v', with_insert('editor.action.refactor'))
vim.keymap.set('n', '<leader>n', with_insert('editor.action.refactor'))

--[[ Multiple carets & selections ]]
vim.keymap.set({ 'n', 'x', 'i' }, '<C-g>', with_insert('editor.action.addSelectionToNextFindMatch'))
vim.keymap.set('n', '<C-M-g>', action('editor.action.selectHighlights'))

--[[ Running & debugging ]]
vim.keymap.set('n', '<leader>b', action('editor.debug.action.toggleBreakpoint'))

--[[ VCS / local history ]]
vim.keymap.set('n', '<leader>a', action('gitlens.toggleFileBlame'))
vim.keymap.set('n', '<leader>h', action('gitlens.showFileHistory'))

--[[ General ]]
vim.keymap.set('n', '<leader><leader>h', action('workbench.action.toggleSidebarVisibility'))
vim.keymap.set('n', '<leader><leader>s', action('workbench.files.action.showActiveFileInExplorer'))
