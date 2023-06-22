-- files config

local file_status, files = pcall(require, "mini.files")
if not file_status then
	print("mini.files not found")
	return
end

files.setup()

vim.keymap.set("n", "<leader>nc", function()
	files.open(vim.api.nvim_buf_get_name(0), false)
end, { desc = "Open Mini File Explorer from current file" })

vim.keymap.set("n", "<leader>nt", function()
	files.open(nil, false)
end, { desc = "Open Mini File Explorer in CWD" })

local aistatus, ai = pcall(require, "mini.ai")
if not aistatus then
	print("mini.ai not found")
	return
end

local aisetup = {
	custom_textobjects = {
		-- Select in function using treesitter
		F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
	},
}

ai.setup(aisetup)

local animate_status, animate = pcall(require, "mini.animate")
if not animate_status then
	print("mini.animate not found")
	return
end

local animate_setup = {
	cursor = {
		enable = false,
		-- timing = animate.gen_timing.linear({ duration = 5, unit = "step" }),
	},
	scroll = {
		timing = animate.gen_timing.linear({ duration = 180, unit = "total" }),
	},
	close = {
		enable = false,
	},
	resize = {
		timing = animate.gen_timing.linear({ duration = 75, unit = "total" }),
		-- enable = false,
	},
}

animate.setup(animate_setup)
-- gen_timing
