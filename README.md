## Tech Stack

### Requirements
- Xcode
- Swift
- Swift Package Manager
- Cocoapods

### Patterns
- MVVM + Router
- Observer
- Delegation

### How to Contribute

We regularly add new tasks to [projects](https://github.com/orgs/afet-yonetim-sistemi/projects/5) area. You can assign one of them to yourself and start the development. **Before development**, you should check [our product repository](https://github.com/afet-yonetim-sistemi/ays-product/tree/main/doc/mobile) to get analysis of the task. You can also access olders. **After development**, there are some rules while reviewing any pull request process, please pay attention to them. We have volunteers so we don't have enough time to contribute so much. Luckily, we have **I don't want to waste my time** section. **Please** read it. It is under Rules section.

#### Rules

- Each branch name should be **{label}/{meaningful-shortcut-of-taskname-with-dash}** (Example given: feature/updating-readme)

- Each commit message should be **{taskname: commit message}** (Example given: Updating README as Contributor-friendly: Add readme etc.)

- Each pull request should contain screenshot of your task content like a mock up, figma design etc.. You should copy and paste it as an image. It provides reviewing better.

- You can track all pull requesting, merging operations via our Discord named **#ios-github-pr** channel.

- Each development needs the documentation. Please write the documentation blocks of your code blocks. We run Jazzy for the documentation.

### I don't want to waste my time

- We have shortcuts to generate a MVVM-Router template, a documentation code block via Xcode snippets.

##### Template

- Close Xcode.
- Go to base iOS repository folder in your local. 
- Find **TemplateGenerator**.
- Change directory to TemplateGenerator using **cd** command via your terminal.
- Inside TemplateGenerator folder, run **open template** command.
- Open Xcode.
- See the template under **Custom** section after creating a new file.

##### Xcode Snippets

- Close Xcode.
- Go to base iOS repository folder in your local.
- Find **SnippetGenerator**.
- Change directory to SnippetGenerator using **cd** command via your terminal.
- Inside SnippetGenerator folder, run **swift run SnippetSharing Snippets**.
- Open Xcode.
- Write anywhere **Jazzy** in any Swift file and see the shortcuts. 

##### How to run Jazzy

[Jazzy](https://github.com/realm/jazzy)
