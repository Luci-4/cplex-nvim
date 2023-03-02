local M = {}


function _run_command_in_terminal(command)
    vim.cmd("ToggleTerm")
    vim.cmd(string.format("TermExec cmd=\"%s\"", command))
end

function run_configuration()

    command = string.format("oplrun -p %s", vim.fn.getcwd())
    _run_command_in_terminal(command)
end

function run_model()

    command = string.format("oplrun %s", vim.api.nvim_buf_get_name(0))
    _run_command_in_terminal(command)

end

return M