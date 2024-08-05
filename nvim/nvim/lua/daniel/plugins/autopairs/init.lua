return {
	{
		"windwp/nvim-ts-autotag",
		config = true,
		lazy = false,
		dependencies = { "nvim-treesitter" },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
			},
		},
	},
	-- config = function(_, opts)
	-- 	require("windwp/nvim-autopairs").setup(opts)
	--
	-- 	local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
	-- 	if not cmp_autopairs_setup then
	-- 		return
	-- 	end
	--
	-- 	-- import nvim-cmp plugin safely (completions plugin)
	-- 	local cmp_setup, cmp = pcall(require, "cmp")
	-- 	if not cmp_setup then
	-- 		return
	-- 	end
	--
	-- 	-- make autopairs and completion work together
	-- 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	-- end,
}
