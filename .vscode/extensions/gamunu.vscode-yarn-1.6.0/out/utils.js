"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const Fs = require("fs");
const Path = require("path");
const vscode_1 = require("vscode");
function packageExists(arg) {
    if (!vscode_1.workspace.rootPath) {
        return false;
    }
    let filepath = Path.join(vscode_1.workspace.rootPath, 'package.json');
    const confPackagejson = vscode_1.workspace.getConfiguration('yarn')['packageJson'];
    if (confPackagejson) {
        filepath = Path.join(vscode_1.workspace.rootPath, confPackagejson);
    }
    const editor = vscode_1.window.activeTextEditor;
    if (editor && editor.document.fileName.endsWith("package.json")) {
        filepath = editor.document.fileName;
    }
    // If the runCommand exected via Explorer contect menu
    if (arg && arg.fsPath) {
        filepath = arg.fsPath;
    }
    try {
        const stat = Fs.statSync(filepath);
        return stat && stat.isFile();
    }
    catch (ignored) {
        return false;
    }
}
exports.packageExists = packageExists;
;
function useTerminal() {
    return vscode_1.workspace.getConfiguration('yarn')['runInTerminal'];
}
exports.useTerminal = useTerminal;
function getYarnBin() {
    return vscode_1.workspace.getConfiguration('yarn')['bin'] || 'yarn';
}
exports.getYarnBin = getYarnBin;
function dontHideOutputOnSuccess() {
    return vscode_1.workspace.getConfiguration('yarn')['dontHideOutputOnSuccess'];
}
exports.dontHideOutputOnSuccess = dontHideOutputOnSuccess;
//# sourceMappingURL=utils.js.map