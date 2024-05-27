return {
  {
    "junegunn/fzf"
  },
  {
    "junegunn/fzf.vim",
    config = function()
      vim.cmd([[
        "FZF Buffer Delete
        function! s:list_buffers()
          redir => list
          silent ls
          redir END
          return split(list, "\n")
        endfunction

        function! s:delete_buffers(lines)
          execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
        endfunction

        command! BD call fzf#run(fzf#wrap({
          \ 'source': s:list_buffers(),
          \ 'sink*': { lines -> s:delete_buffers(lines) },
          \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
        \ }))
      ]])

      vim.keymap.set("n", "<c-p>", ":Files<cr>", { remap = false })
      vim.keymap.set("n", "<c-r>", ":Buffers<cr>", { remap = false })
    end,
  },
}
