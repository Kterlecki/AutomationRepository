# AutomationRepository

# Scripts

## Dotnet Project Builder
- Bash script to clone a respository down to you local Computer
- It will install a dotnet template - you specify which template
- Items that will be completed
1. Dotnet Project file creation
2. Dotnet Test file creation
3. Dotnet Solution file creation
4. Dotnet Solution file add all `.csproj` files
5. Dotnet Reference add to `test.csproj` from `src.csproj`
6. Dotnet Solution file projects list

- How to run: `./dotnetProjectBuilder.sh https://github.com/Kterlecki/AutomationRepository console`
- Note: dotnetProjectBuilder needs to be in your current Directory