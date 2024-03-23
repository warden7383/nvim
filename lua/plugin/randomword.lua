require('randomword').setup({
  templates = {
    lua = {
      default = 'print(string.format("<word> %s", <cursor>))',
      line = "print('<word>')",
    },
    go = {
      default = 'fmt.Printf("<word>: %v \\n", <cursor>)',
      line = 'fmt.Println("<word>")',
    },
    -- Add more language-specific templates here
    cpp = {
      -- default = 'cout << "<word> %s"'
      line = 'cout << "<word>" << endl;'
    }
  },
  keybinds = {
    default = '<leader>rw',
    line = '<leader>rl',
    -- Add more keybinds here
  }
})
