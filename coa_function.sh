coa() {
  declare -A users
  declare -A shortcuts
  declare -A emails

  if [ -f "$HOME/gitcoauthors.csv" ]
  then
    while IFS=, read -r username name alternative_email shortcut
    do
      users[$username]="$name"
      shortcuts[$shortcut]="$username"
      emails[$username]="$alternative_email"
    done < ~/gitcoauthors.csv
  else
    echo "ERROR: please create the file ~/gitcoauthors.csv in the following format, one line per user:"
    echo
    echo "{username},{name},{no_reply_email},{username_abbreviation}"
    echo
    echo "Examples:"
    echo "  someone,Some One,000000+someone@users.noreply.github.com,so"
    echo "  someone,Some One,,"
    echo
    echo "The first two columns are required. Use blank value for other columns" \
      "that have no value, but make sure to keep the commas in between."
    return
  fi

  for possible_username in $@
  do
    username=$possible_username
    name="$users[$username]"
    if [ -z "$name" ]
    then
      username="$shortcuts[$username]"
      name="$users[$username]"
    fi
    email=$username@github.com
    alternative_email="$emails[$username]"
    if [ -n "$alternative_email" ]
    then
      email=$alternative_email
    fi
    echo "Co-Authored-By: $name <$email>"
  done
}
