#!/bin/bash
set -eu

dotnetProjectBuilder(){
    github_project_name=$1


    if [ $? -ne 0 ]; then
        echo "Error: Required credentials for new dotnet project not entered"
        return 1
    fi

    if [ [$github_project_name =~ [^\/]*(?=\.git$)]]; then
        project_name="${BASH_REMATCH[0]}"
    else
        echo "Invalid github URL format"
        return 1

    git clone $github_project_name
    cd 
}



## notes
# [^\/]*: Character Class and Quantifier

# [^\/]: The caret ^ inside square brackets [] denotes a character class. It means "match any character except the ones listed in the brackets." 
# In this case, we are matching any character except a forward slash.
# *: The asterisk is a quantifier and means "match zero or more occurrences" of the preceding pattern, which is the character class [^\/].
# Purpose: This part matches any sequence of characters (repository name) that does not contain forward slashes. 
# It will match characters from the beginning of the input string until it encounters a forward slash or reaches the end of the string.
# (?=\.git$): Positive Lookahead Assertion

# (?= ... ): This is a special syntax in regex for a positive lookahead assertion. It allows you to check that a pattern is followed by another pattern without including the following pattern in the actual match.
# \.: The backslash \ is used to escape the dot . character, which is a special character in regex and matches any character except a newline.
# git: This is the literal string "git" that we are looking for.
# $: The dollar sign at the end anchors the pattern to match only at the end of the string.
# Purpose: This part ensures that the pattern we are interested in (the repository name) is followed by ".git" at the end of the string. 
# The lookahead assertion checks that the pattern exists but does not include it in the match. This means the ".git" extension won't be part of the extracted repository name.