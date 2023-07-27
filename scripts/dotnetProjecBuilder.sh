#!/bin/bash
set -eu

dotnetProjectBuilder(){
    github_project_name=$1
    project_type=$2

    if [ $? -ne 0 ]; then
        echo "Error: Required credentials for new dotnet project not entered"
        return 1
    fi

    if [[ $github_project_name =~ /([^/]+)\.git$ ]]; then
        project_name="${BASH_REMATCH[1]}"
    else
        echo "Invalid github URL format"
        return 1
    fi

    git clone "$github_project_name"
    cd "$project_name"
    dotnet new "$project_type" -o src/ --name "$project_name"
    dotnet new xunit -o test/ --name "$project_name"Test
    dotnet new sln --name "$project_name"
    dotnet sln add **/*.csproj
    dotnet add "test/"$project_name"Test.csproj" reference "src/$project_name.csproj"
    dotnet sln list
}

dotnetProjectBuilder "$1" "$2"