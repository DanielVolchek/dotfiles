local status, tterm = pcall(require, "toggleterm")
if not status then
	return
end

tterm.setup()
