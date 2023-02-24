import ArgumentParser
import Foundation

struct SnippetSharing: ParsableCommand {
    
    @Argument(help: "Name of Snippet(s) Folder")
    var folderName: String
    
    private var manager: FileManager {
        FileManager.default
    }
    private var snippetFolderPathOfXcode: String {
        "~/Library/Developer/Xcode/UserData/CodeSnippets/"
    }
    private var currentFolderPath: String {
        manager.currentDirectoryPath
    }
    
    @Flag(name: .shortAndLong, help: "For additional logs")
    var verbose: Bool = false
 
    func run() throws {
        let folders = try listAllFoldersOfCurrentPath()
        guard folders.isEmpty == false else {
            return
        }
        for folder in folders {
            if folder.contains(folderName) {
                if verbose {
                    print("Your Snippet Folder Path: \(folder)")
                }
                removeSnippetsFolder()
                createSnippetsFolder()
                copySnippets(folder: folder)
                return
            }
        }
        print("Folder name is wrong")
    }
    
    
    func listAllFoldersOfCurrentPath() throws -> [String] {
        let output = try shell("ls -d \(currentFolderPath)/*/")
        return output.components(separatedBy: "\n").filter { $0 != "" }
    }
    
    func removeSnippetsFolder() {
        do {
            _ = try shell("rm -rf \(snippetFolderPathOfXcode)")
            if verbose {
                print("Your snippet folder deleted. Because, it is already exist. It will be created soon.")
            }
        } catch(let error) {
            if verbose {
                print(error.localizedDescription)
            }
        }
    }
    
    func copySnippets(folder: String) {
        _ = try? shell("cp -r \(folder) \(snippetFolderPathOfXcode)")
    }
    
    func createSnippetsFolder() {
        do {
            _ = try shell("mkdir \(snippetFolderPathOfXcode)")
            if verbose {
                print("Your snippet folder created: \(snippetFolderPathOfXcode)")
            }
        } catch(let error) {
            if verbose {
                print(error.localizedDescription)
            }
        }
    }
}

enum Error: Swift.Error {
    case shellOutputFailed
}

func shell(_ command: String) throws -> String {
    let task = Process()
    task.launchPath = "/bin/bash"
    task.arguments = ["-c", command]
    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    
    task.waitUntilExit()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    
    guard let output = String(data: data, encoding: .utf8) else {
        throw Error.shellOutputFailed
    }
    
    return output
}


SnippetSharing.main()
