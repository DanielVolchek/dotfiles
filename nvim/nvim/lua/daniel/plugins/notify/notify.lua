local status, notify = pcall(require, "notify")
if not status then
	return
end

notify.setup({
	timeout = 750,
})
