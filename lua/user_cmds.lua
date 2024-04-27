-- Render markdown as PDF using Pandoc and Eisvogel template
-- (https://github.com/Wandmalfarbe/pandoc-latex-template)
vim.api.nvim_create_user_command(
    'Eisvogel', '!pandoc % -o %:r.pdf --template eisvogel --listings', {}
)
