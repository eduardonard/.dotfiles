#!/bin/sh

git_branch_name() {
  local git_branch
  local git_status
  local project_name

  # Check if the current directory is a Git repository
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    # Get the project name (repository root folder name)
    project_name=$(basename "$(git rev-parse --show-toplevel)")

    # Get the current branch name
    git_branch=$(git symbolic-ref --short HEAD 2>/dev/null)

    # Check for changes, ahead/behind status, merge conflicts, rebases, and unstaged changes
    local git_status_clean
    local git_status_ahead
    local git_status_behind
    local git_merge_conflict
    local git_rebase
    local git_unstaged_changes_count
    local git_staged_changes_count
    local git_unpushed_commits_count

    git_status_clean=$(git status --porcelain 2>/dev/null)
    git_status_ahead=$(git rev-list --count HEAD..@{upstream} 2>/dev/null)
    git_status_behind=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)

    # Count unstaged changes
    git_unstaged_changes_count=$(git status --porcelain | grep '^.[^ ]' | wc -l)

    # Count staged changes (not committed)
    git_staged_changes_count=$(git diff --cached --name-only | wc -l)

    # Count unpushed commits
    git_unpushed_commits_count=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)

    # Check if there is an ongoing merge
    git_merge_conflict=$(git ls-files -u 2>/dev/null)

    # Check if there is an ongoing rebase
    git_rebase=$(git status | grep "rebase in progress" 2>/dev/null)

    # Default color is white
    local git_color='%F{white}'
    local status_text=""

    if [ -n "$git_merge_conflict" ]; then
      # Merge conflicts detected
      git_color='%F{magenta}'
      status_text="MERGING"
    elif [ -n "$git_rebase" ]; then
      # Rebase in progress
      git_color='%F{yellow}'
      status_text="REBASE"
    elif [ -n "$git_status_clean" ]; then
      if [ "$git_unstaged_changes_count" -gt 0 ]; then
        # Unstaged changes exist
        git_color='%F{red}'
        status_text="UNSTAGED ($git_unstaged_changes_count)"
      elif [ "$git_staged_changes_count" -gt 0 ]; then
        # Staged changes exist (not yet committed)
        git_color='%F{orange}'
        status_text="STAGED ($git_staged_changes_count)"
      else
        # Clean and up-to-date with no staged or unstaged changes
        git_color='%F{green}'
        status_text="CLEAN"
      fi
    elif [ "$git_status_ahead" -gt 0 ] && [ "$git_status_behind" -gt 0 ]; then
      # Branch is both ahead and behind (diverged)
      git_color='%F{blue}'
      status_text="DIVERGED (AHEAD: $git_status_ahead, BEHIND: $git_status_behind)"
    elif [ "$git_status_ahead" -gt 0 ]; then
      # Branch is ahead of upstream (with unpushed commits)
      git_color='%F{cyan}'
      status_text="AHEAD ($git_unpushed_commits_count unpushed)"
    elif [ "$git_status_behind" -gt 0 ]; then
      # Branch is behind upstream (showing how many commits behind)
      git_color='%F{yellow}'
      status_text="BEHIND ($git_status_behind commits)"
    else
      # Clean and up-to-date
      git_color='%F{green}'
      status_text="CLEAN"
    fi

    git_status="${git_color}[${git_branch}][${status_text}]%f"
  fi

  # Return the Git status info
  echo "$git_status%F{white}"
}