"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const child_process_1 = require("child_process");
const vscode_1 = require("vscode");
const output_1 = require("./output");
const run_in_terminal_1 = require("run-in-terminal");
const utils_1 = require("./utils");
const Path = require("path");
const kill = require('tree-kill');
exports.terminal = null;
exports.childs = new Map();
function terminate(pid) {
    const childCommand = exports.childs.get(pid);
    if (childCommand.child) {
        output_1.outputChannel.appendLine('');
        output_1.outputChannel.appendLine(`Killing process: ${childCommand.cmd} (pid:${pid})`);
        output_1.outputChannel.appendLine('');
        childCommand.killedByUs = true;
        kill(pid, 'SIGTERM');
    }
}
exports.terminate = terminate;
function runCommand(args, arg) {
    let cwd = vscode_1.workspace.rootPath;
    const confPackagejson = vscode_1.workspace.getConfiguration('yarn')['packageJson'];
    if (confPackagejson) {
        cwd = Path.join(vscode_1.workspace.rootPath, confPackagejson).replace(/package.json$/i, "");
    }
    const editor = vscode_1.window.activeTextEditor;
    if (editor && editor.document.fileName.endsWith("package.json")) {
        cwd = editor.document.fileName.replace(/package.json$/i, "");
    }
    // If the runCommand exected via Explorer contect menu
    if (arg && arg.fsPath) {
        cwd = arg.fsPath.replace(/package.json$/i, "");
    }
    const options = {
        cwd: cwd,
        env: process.env
    };
    if (utils_1.useTerminal()) {
        if (typeof vscode_1.window.createTerminal === 'function') {
            runCommandInIntegratedTerminal(args, cwd);
        }
        else {
            runCommandInTerminal(args, options);
        }
    }
    else {
        runCommandInOutputWindow(args, cwd);
    }
}
exports.runCommand = runCommand;
;
function runCommandInTerminal(args, options) {
    run_in_terminal_1.runInTerminal(utils_1.getYarnBin(), args, options);
}
function runCommandInIntegratedTerminal(args, cwd) {
    const cmd_args = Array.from(args);
    if (!exports.terminal) {
        exports.terminal = vscode_1.window.createTerminal('Yarn');
    }
    exports.terminal.show();
    if (cwd) {
        // Replace single backslash with double backslash.
        const textCwd = cwd.replace(/\\/g, '\\\\');
        exports.terminal.sendText(['cd', `"${textCwd}"`].join(' '));
    }
    cmd_args.splice(0, 0, utils_1.getYarnBin());
    exports.terminal.sendText(cmd_args.join(' '));
}
function runCommandInOutputWindow(args, cwd) {
    const cmd = utils_1.getYarnBin() + ' ' + args.join(' ');
    const child = child_process_1.exec(cmd, { cwd: cwd, env: process.env });
    exports.childs.set(child.pid, { child: child, cmd: cmd });
    child.on('exit', (code, signal) => {
        if (signal === 'SIGTERM' || exports.childs.get(child.pid).killedByUs) {
            output_1.outputChannel.appendLine('');
            output_1.outputChannel.appendLine('Successfully killed process');
            output_1.outputChannel.appendLine('');
            output_1.outputChannel.appendLine('--------------------');
            output_1.outputChannel.appendLine('');
        }
        if (code === 0) {
            output_1.outputChannel.appendLine('');
            output_1.outputChannel.appendLine('--------------------');
            output_1.outputChannel.appendLine('');
            if (!utils_1.dontHideOutputOnSuccess()) {
                output_1.outputChannel.hide();
            }
        }
        exports.childs.delete(child.pid);
    });
    output_1.outputChannel.appendLine(cmd);
    output_1.outputChannel.appendLine('');
    const append = function (data) {
        output_1.outputChannel.append(data);
    };
    child.stderr.on('data', append);
    child.stdout.on('data', append);
    output_1.outputChannel.show(vscode_1.ViewColumn.Three);
}
//# sourceMappingURL=run-command.js.map