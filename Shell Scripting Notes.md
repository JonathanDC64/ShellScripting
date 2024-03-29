# Shell scripting

- [Shell scripting](#shell-scripting)
  - [\# (Sharp) + ! (Bang) = #! (Shebang)](#sharp---bang---shebang)
  - [Comments](#comments)
  - [echo - Output to terminal](#echo---output-to-terminal)
  - [pwd - Current work directory](#pwd---current-work-directory)
  - [touch - Create an empty file](#touch---create-an-empty-file)
  - [type - Check if command is a shell builtin](#type---check-if-command-is-a-shell-builtin)
  - [help - Get help on a command](#help---get-help-on-a-command)
  - [uptime - How long your system has been up](#uptime---how-long-your-system-has-been-up)
  - [man - Get info on non-builtin commands](#man---get-info-on-non-builtin-commands)
  - [cat - Print files on the standard output](#cat---print-files-on-the-standard-output)
  - [chmod - Alter file or Directory permissions](#chmod---alter-file-or-directory-permissions)
  - [Define variable](#define-variable)
  - [Output value of variable](#output-value-of-variable)
  - [Store output of command in variable (Command substitution)](#store-output-of-command-in-variable-command-substitution)
  - [Builtin variables](#builtin-variables)
  - [id - Get users id's](#id---get-users-ids)
  - [If statements](#if-statements)
  - [Exit status of last command](#exit-status-of-last-command)
  - [Read value from standard input](#read-value-from-standard-input)
  - [Pipe operator](#pipe-operator)
  - [useradd - Add a new user to the system](#useradd---add-a-new-user-to-the-system)
  - [passwd - Change or add password to account](#passwd---change-or-add-password-to-account)
  - [ps - View running processes](#ps---view-running-processes)
  - [date - Get the current time](#date---get-the-current-time)
  - [Checksum hash](#checksum-hash)
  - [shuf - Generate random permutations](#shuf---generate-random-permutations)
  - [fold - Wraps text to desired width](#fold---wraps-text-to-desired-width)
  - [Positional parameters and Special Parameters](#positional-parameters-and-special-parameters)
  - [which - Displays the path of the commands program](#which---displays-the-path-of-the-commands-program)
  - [hash - Reset PATH program associations](#hash---reset-path-program-associations)
  - [basename - Strip Directory and suffix from filenames](#basename---strip-directory-and-suffix-from-filenames)
  - [dirname - Get directory name of a file](#dirname---get-directory-name-of-a-file)
  - [For loops](#for-loops)
  - [While loops](#while-loops)
  - [sleep - Delay execution for a specified amount of time](#sleep---delay-execution-for-a-specified-amount-of-time)
  - [shift - Rename positional parameters](#shift---rename-positional-parameters)
  - [Redirect output to a file](#redirect-output-to-a-file)
  - [Redirect Input to a command](#redirect-input-to-a-command)
  - [File descriptors](#file-descriptors)
  - [Discarding output using /dev/null](#discarding-output-using-devnull)
  - [Case Statements](#case-statements)
  - [Functions](#functions)
  - [logger - Record messages to the systems logs](#logger---record-messages-to-the-systems-logs)
  - [getopts - Parse command line arguments](#getopts---parse-command-line-arguments)
  - [Arithmetic](#arithmetic)
  - [locate - Find files](#locate---find-files)
  - [find - Search entire directory for file](#find---search-entire-directory-for-file)
  - [userdel - Delete an existing user](#userdel---delete-an-existing-user)
  - [grep - Finds lines that match a pattern and discards everything else](#grep---finds-lines-that-match-a-pattern-and-discards-everything-else)
  - [tar - Create an archive containing several files and directories](#tar---create-an-archive-containing-several-files-and-directories)
  - [gzip - Compress a file](#gzip---compress-a-file)
  - [gunzip - Unzip a file](#gunzip---unzip-a-file)
  - [chage - Expire/Lock account](#chage---expirelock-account)
  - [usermod - modify a user account](#usermod---modify-a-user-account)
  - [cut - Gets specific part of an input](#cut---gets-specific-part-of-an-input)
  - [awk - Pattern scanning and processing language](#awk---pattern-scanning-and-processing-language)
  - [netstat - View open ports](#netstat---view-open-ports)
  - [sort - Sort content of a file alphabetically](#sort---sort-content-of-a-file-alphabetically)
  - [du - Disk usage info](#du---disk-usage-info)
  - [uniq - Removes duplicate lines](#uniq---removes-duplicate-lines)
  - [wc - Word count](#wc---word-count)
  - [/etc/hosts files is used to resolve hostnames into IP's](#etchosts-files-is-used-to-resolve-hostnames-into-ips)
  - [tee - Read from STDIN and write to STDOUT and files](#tee---read-from-stdin-and-write-to-stdout-and-files)
  - [ssh-keygen - Generate SSH key](#ssh-keygen---generate-ssh-key)
  - [ssh-copy-id - Use local SSH key to login to remote machine](#ssh-copy-id---use-local-ssh-key-to-login-to-remote-machine)
  - [Remotely execute commands on other machine using SSH](#remotely-execute-commands-on-other-machine-using-ssh)

## \# (Sharp) + ! (Bang) = #! (Shebang)

Always start script with a shebang.

Indicates to use the /bin/bash interpreter.

```bash
#!/bin/bash
```

## Comments

```bash
# Hello world
```

## echo - Output to terminal

```bash
echo 'Hello World'
# Hello World
```

## pwd - Current work directory

```bash
pwd
# /vagrant
```

## touch - Create an empty file

Updates timestamp if file exists

```bash
touch filename
```

## type - Check if command is a shell builtin

```bash
type echo
# echo is a shell builtin

type -a echo
# echo is a shell builtin
# echo is /usr/bin/echo
```

## help - Get help on a command

```bash
help echo
```

## uptime - How long your system has been up

```bash
uptime
#  8:46:27 up 27 min,  1 user,  load average: 0.00, 0.01, 0.04
```

## man - Get info on non-builtin commands

```bash
man uptime
```

## cat - Print files on the standard output

```bash
cat filename
```

## chmod - Alter file or Directory permissions

```bash
# Give execute permission to owner
chmod 755 script

chmod +x script
```

## Define variable

There must not be any spaces next to the =

Variable names can contain [a-z], [A-Z], [0-9] and _

Cannot start with digits [0-9]

Use `" "` so that variables inside expand.

Will not expand with `' '`.

Ex: `"${VAR}"` vs. `'${VAR}'`

```bash
WORD='script'
readonly VERBOSE='true' # Cannot be modified after value is assigned
```

## Output value of variable

Conventionally, variables are upper case.

In general, single quotes ' ' prevent the expansion of variables.

Use double quotes " " to expand variables.

Use the `"${WORD}"`to append text to a variable

```bash
echo "$WORD"
# script

echo "This is a shell ${WORD}"
# This is a shell script

echo "${WORD}ing is fun!"
# scripting is fun!
```

## Store output of command in variable (Command substitution)

```bash
USER_NAME=$(id -un)
echo "Username: $(id -un)"

# This is the old style
USER_NAME=`id -un`
```

## Builtin variables

```bash
# The current users UID
echo "${UID}"
# 1000
echo "${EUID}"
# 1000

echo "${HOSTNAME}"
echo "${RANDOM}"
# ...

# Under 'shell variables' for more builtin variables
man bash
```

## id - Get users id's

```bash
id
# uid=1000(vagrant) gid=1000(vagrant) groups=1000(vagrant)

id -u
# 1000

# display username
id -u -n
# vagrant

id -un
# vagrant

whoami
# vagrant
```

## If statements

Look at `help test | less` for conditions help.

```bash
# Syntax
if [[ COMANDS ]]
then
    COMMANDS
elif [[ COMMANDS ]]
then
    COMMANDS
else
    COMMANDS
fi


if [[ "${UID}" -eq 0 ]]
then
    echo "You are root."
else
    echo 'You are not root'
fi

UID_TO_TEST_FOR='1000'
if [[ "${UID}" -ne UID_TO_TEST_FOR ]]
then
    echo "UID is not ${UID_TO_TEST_FOR} it is ${UID}"
    exit 1 # Specify a exit status, return 0 if successful, else non 0
fi

# String comparison using =
USER_NAME_TO_TEST_FOR='vagrant'
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then
    echo "Your username matches ${USER_NAME_TO_TEST_FOR}"
fi

# Else if
# if [[ "${1}" = 'start' ]]
# then
#     echo 'tarting'
# elif [[ "${1}" = 'stop' ]]
# then
#     echo 'Stopping'
# elif [[ "${1}" = 'status' ]]
# then
#     echo 'Status:'
# else
#     echo 'Supply a valid option.'
#     exit 1
# fi

#arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne, -lt, -le, -gt, or -ge.
```

## Exit status of last command

0 = true / successful

1 = false / unsuccessful

Any non-zero exit status represents a failure.

Use `${?}` builtin to get exit status of last command.

Note if an `exit n` command is not explicitly defined,
the exit status of a script will be that of the last command.

```bash
if [[ "${?}" -ne 0 ]]
then
    echo "The id command did not execute successfully"
    exit 1
fi
```

## Read value from standard input

add `-p` for a prompt.

Value is stored in supplied `VARIABLE`

```bash
read -p "Type something: " VARIABLE
```

## Pipe operator

Takes standard output from one command as standard input of another command

`echo` can be used to provide standard output

```bash
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
```

## useradd - Add a new user to the system

Conventionally, usernames are limited to 8 characters
and all lowercase.

Having more than 8 characters does not create
many problems though.

The `-m` flag creates a home directory for the user.

The `-c` flag attaches a comment to the user.

```bash
useradd -c "${COMMENT}" -m "${USER_NAME}"
```

## passwd - Change or add password to account

`--stdin` flag makes `passwd` take standard input as password.
`-e` sets expiration of password.

```bash
echo "${PASSWORD}" | passwd --stdin ${USER_NAME}
passwd -e ${USER_NAME}
```

## ps - View running processes

```bash
ps -ef
ps -aux
```

## date - Get the current time

```bash
date
# Sun 22 Sep 12:46:54 EDT 2019

# Epoch time since 1970-01-01 00:00:00 UTC
date +%s
# 1569170826

# Epoch time nanoseconds
date +%s%N
# 1569171107982611457
```

## Checksum hash

```bash
ls -la /usr/bin/*sum

cksum filename
md5sum filename
sha1sum filename
sha224sum filename
sha256sum filename
sha384sum filename
sha512sum filename

echo $(date +%s) | sha256sum
# e9ed171e3ee621e56d2d9bf2cbd3902504f0bf5131fcdccd8441a275cf1aa32c  -

echo $(date +%s%N) | sha256sum | head -c 10
# b03ae8b0ca
```

## shuf - Generate random permutations

shuf randomizes the order of the lines from standard input / file

if you wan to randomize the order of characters you need to delimit them
by newlines.

```bash
echo $'a\nb\nc' | shuf
# c
# b
# a

echo $'a\nb\nc' | shuf
# b
# a
# c
```

## fold - Wraps text to desired width

```bash
echo "123" | fold -w1
# 1
# 2
# 3
```

## Positional parameters and Special Parameters

`$0` Stores the script name.

`$1` Stores the first argument.

`$2` Stores the second argument.

`$n` Stores the nth argument.

`$*` When used in quotes: `"$1 $2 $3 ..."`

`$@` When used in quotes: `"$1" "$2" "$3" ...`

`$#` The number of positional parameters

```bash
# First parameter is the path used for the script
echo "You executed this command ${0}"
# You executed this command ./luser-demo06.sh

# if you use the full path it changes
echo "You executed this command ${0}"
# You executed this command /vagrant/luser-demo06.sh

LAST_COMMAND_EXIT_CODE="${?}"
NUMBER_OF_PARAMETERS="${#}"
PARAMETER_LIST="${@}" # Same as ${*} when not enclosed in " "
PARAMETER_LIST_STRING="${*}" # When ${*} is enclosed in " " it makes a single string with all params
OPTION_FLAGS="${-}"
SHELL_PROCESS_ID="${$}"

```

## which - Displays the path of the commands program

```bash
which head
# /usr/bin/head

# When adding your own head command for example
which -a head
# /usr/local/bin/head
# /usr/bin/head
```

## hash - Reset PATH program associations

```bash
hash -r
```

## basename - Strip Directory and suffix from filenames

Path doesn't have to exist for `basename` to work

```bash
basename /some/path/to/a/file.ext
# file.ext
```

## dirname - Get directory name of a file

Path doesn't have to exist for `dirname` to work

```bash
dirname /some/path/to/a/file.ext
# /some/path/to/a
```

## For loops

```bash
# Syntax
for VARIABLE in LIST
do
    COMMANDS
done


for X in Frank Claire Doug
do
  echo "Hi ${X}."
done
# Hi Frank.
# Hi Claire.
# Hi Doug.
```

## While loops

```bash
# Syntax
while [[ COMMANDS ]]
do
    COMMANDS
done


X=1
while [[ "$X" -eq 1 ]]
do
  echo "This is the value of X: ${X}"
  X=7
done
# This is the value of X: 1

# You can use a builtin command called `true` which always returns exit code 0
# Here is an infinite loop, use Ctrl+C to escape the loop
while [[ true ]]
do
    echo "${RANDOM}"
    sleep 1
done
```

## sleep - Delay execution for a specified amount of time

```bash
sleep 1
sleep 1s
sleep .5
```

## shift - Rename positional parameters

From $N+1, $N+2, ... to $1, $2...
N is 1 by default.
Must not be negative or greater than $#

```bash
shift
shift 1 # same as just shift
shift 2
```

## Redirect output to a file

```bash
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

id -un > id

# To append to a file, use >>
head -n1 /etc/passwd >> ${FILE}
```

## Redirect Input to a command

```bash
# Read from the file rather than the keyboard
read LINE < ${FILE}
echo "LINE contains: ${LINE}"
# LINE contains: root:x:0:0:root:/root:/bin/bash

# same as (0 refers to standard input, it is file descriptor)
read LINE 0< ${FILE}
echo "LINE contains: ${LINE}"
```

## File descriptors

0 : Standard input = STDIN_FILENO = stdin

1 : Standard output = STDOUT_FILENO = stdout

2 : Standard error = STDERR_FILENO = stderr

Note that pipes only receive the standard output of the piped command,
not the standard error.

```bash
read X 0< /etc/centos-release
echo ${X}
# CentOS Linux release 7.4.1708 (Core)

echo ${UID} 1> uid
cat uid
# 1000

head -n1 /etc/passwd /etc/hosts /fakefile
# ==> /etc/passwd <==
# root:x:0:0:root:/root:/bin/bash
#
# ==> /etc/hosts <==
# 127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
# head: cannot open ‘/fakefile’ for reading: No such file or directory

head -n1 /etc/passwd /etc/hosts /fakefile 2> error.log
# ==> /etc/passwd <==
# root:x:0:0:root:/root:/bin/bash
#
# ==> /etc/hosts <==
# 127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
cat error.log
# head: cannot open ‘/fakefile’ for reading: No such file or directory

# You can also do multiple redirection at once
head -n1 /etc/passwd /etc/hosts /fakefile 1> head_output.log 2> error.log

# Redirect both standard output and error to the same file
# (2>&1 means to redirect standard error to standard output and since we use > previously, it gets stored in the file)
head -n1 /etc/passwd /etc/hosts /fakefile > head.both 2>&1

# Same way of doing previous command
head -n1 /etc/passwd /etc/hosts /fakefile &> head.both

# Pipe standard output and standard error
head -n1 /etc/passwd /etc/hosts /fakefile 2>&1 | cat -n

# Same as previous command
head -n1 /etc/passwd /etc/hosts /fakefile |& cat -n

# Sending output to standard error
echo "This is STDERR" 1>&2
```

## Discarding output using /dev/null

```bash
# Discards the standard output
head -n1 /etc/passwd /etc/hosts /fakefile > /dev/null
# head: cannot open ‘/fakefile’ for reading: No such file or directory
```

## Case Statements

Check bash manpage for pattern matching for more info.

```bash
case "${1}" in
    start)
        echo 'Starting.'
        ;;
    stop)
        echo 'Stopping.'
        ;;
    status|state|--status|--state) # or
        echo 'Status:'
        ;;
    *) # default
        echo 'Supply a valid option'
        exit 1
        ;;
esac
```

## Functions

```bash

function log() {
    local MESSAGE="${@}" # local means it only exists within the scope of the function
    echo "${MESSAGE}"
}

log 'Hello'
log 'This is fun!'
# Hello
# This is fun!

```

## logger - Record messages to the systems logs

```bash
logger 'Hello from the command line'
sudo tail /var/log/messages
# Sep 23 14:01:01 localhost systemd: Starting Session 23 of user root.
# Sep 23 14:01:01 localhost systemd: Removed slice User Slice of root.
# Sep 23 14:01:01 localhost systemd: Stopping User Slice of root.
# Sep 23 15:01:01 localhost systemd: Created slice User Slice of root.
# Sep 23 15:01:01 localhost systemd: Starting User Slice of root.
# Sep 23 15:01:01 localhost systemd: Started Session 24 of user root.
# Sep 23 15:01:01 localhost systemd: Starting Session 24 of user root.
# Sep 23 15:01:01 localhost systemd: Removed slice User Slice of root.
# Sep 23 15:01:01 localhost systemd: Stopping User Slice of root.
# Sep 23 15:03:59 localhost vagrant: Hello from the command line

logger -t my-script 'Tagging on.'
sudo tail -n1 /var/log/message
# Sep 23 15:05:36 localhost my-script: Tagging on.
```

## getopts - Parse command line arguments

```bash

# If a letter is followed by a :, it is expected to have an argument
while getopts vl:s OPTION
do
    echo "${OPTION}: ${OPTARG}"
done

# Suppose the above script is contained in ./luser-demo11.sh
./luser-demo11.sh -v -l 6 -s
# v:
# l: 6
# s:

# OPTIND gives the position of the next command line argument.
# Useful for after parameters are process
shift $((OPTIND-1))
```

## Arithmetic

Bash does not support floating point arithmetic, you need to use
something like `bc` or `awk` to calculate floating point values.

```bash
# Arithmetic expansion
NUM=$(( 1 + 2 ))
echo ${NUM}
# 3

DICEA='3'
DICEB='6'
TOTAL=$(( DICEA + DICEB ))
echo ${TOTAL}
# 9

NUM='1'
(( NUM++  ))
echo ${NUM}
# 2

NUM='2'(( NUM--  ))
echo ${NUM}
# 1

NUM='1'
(( NUM += 5 ))
echo ${NUM}
# 6

# let operations
# id++, id--      variable post-increment, post-decrement
# ++id, --id      variable pre-increment, pre-decrement
# -, +            unary minus, plus
# !, ~            logical and bitwise negation
# **              exponentiation
# *, /, %         multiplication, division, remainder
# +, -            addition, subtraction
# <<, >>          left and right bitwise shifts
# <=, >=, <, >    comparison
# ==, !=          equality, inequality
# &               bitwise AND
# ^               bitwise XOR
# |               bitwise OR
# &&              logical AND
# ||              logical OR
# expr ? expr : expr
#                 conditional operator
# =, *=, /=, %=,
# +=, -=, <<=, >>=,
# &=, ^=, |=      assignment

let NUM='2 + 3'
echo ${NUM}
# 5

let NUM++
echo ${NUM}
# 6

expr 1 + 1
# 2

NUM=$(expr 2 + 3)
echo ${NUM}
# 5

echo '6 / 4' | bc -l
# 1.50000000000000000000

awk 'BEGIN {print 6/4}'
# 1.5

```

## locate - Find files

```bash
locate userdel
# /usr/sbin/luserdel
# /usr/sbin/userdel
# /usr/share/bash-completion/completions/userdel
# /usr/share/man/de/man8/userdel.8.gz
# /usr/share/man/fr/man8/userdel.8.gz
# /usr/share/man/it/man8/userdel.8.gz
# /usr/share/man/ja/man8/userdel.8.gz
# /usr/share/man/man1/luserdel.1.gz
# /usr/share/man/man8/userdel.8.gz
# /usr/share/man/pl/man8/userdel.8.gz
# /usr/share/man/ru/man8/userdel.8.gz
# /usr/share/man/sv/man8/userdel.8.gz
# /usr/share/man/tr/man8/userdel.8.gz
# /usr/share/man/zh_CN/man8/userdel.8.gz
# /usr/share/man/zh_TW/man8/userdel.8.gz

# locate without root privilege
locate .bashrc
# /etc/skel/.bashrc
# /home/vagrant/.bashrc

# locate with root privilege
sudo locate .bashrc
# /etc/skel/.bashrc
# /home/Jon1/.bashrc
# /home/brussell/.bashrc
# /home/jlocke/.bashrc
# /home/jsmith/.bashrc
# /home/moor/.bashrc
# /home/philapp/.bashrc
# /home/turing/.bashrc
# /home/vagrant/.bashrc
# /home/woz/.bashrc
# /root/.bashrc

# to update locate database use updatedb
touch userdel
sudo updatedb
locate userdel
# /usr/sbin/luserdel
# /usr/sbin/userdel
# ...
# /usr/share/man/zh_TW/man8/userdel.8.gz
# /vagrant/userdel  <====== Newly create file found by locate b/c of updatedb
```

## find - Search entire directory for file

```bash
find /usr/sbin/ -name userdel
# /usr/sbin/userdel

# to search entire drive use / as path, usually have to use sudo to prevent permission error
# or redirect standard error to /dev/null
sudo find / -name userdel
## ......

find / -name userdel 2> /dev/null
# /vagrant/userdel
# /usr/sbin/userdel
# /usr/share/bash-completion/completions/userdel
```

## userdel - Delete an existing user

```bash
# May not be available on your system
# Use locate userdel to see possible locations
# Or perhaps you have to switch to the root user using su - or sudo

# This will delete the user, but keep its files
sudo userdel username

# Remove user and its home directory
sudo userdel -r isaac

# Check /etc/passwd or `id username` to see if user was deleted

```

## grep - Finds lines that match a pattern and discards everything else

```bash
locate userdel | grep bin
/usr/sbin/luserdel
/usr/sbin/userdel
```

## tar - Create an archive containing several files and directories

`-c` create an archive

`-f FILENAME` specify the filename of the archive file (ex: archive.tar)

`-t` list contents of an archive

`-v` verbose

`-x` extract archive

`-z` to compress archive as .gz (using gzip)

```bash
# Create archive.tar from files foo and bar.
tar -cf archive.tar foo bar

# List all files in archive.tar verbosely.
tar -tvf archive.tar

# Extract all files from archive.tar
tar -xf archive.tar

# Create and compress archive
tar -zcvf archive.tar.gz file1 file2

```

## gzip - Compress a file

Usually used to compress tar files as tar.gz

```bash
# Create archive.tar.gz compressed archive
gzip archive.tar

```

## gunzip - Unzip a file

```bash
gunzip archive.tar.gz
```

## chage - Expire/Lock account

Note: You should not use the commands:

`passwd -l username` to lock account

or

`passwd -u username` to unlock account

Since these do not prevent users from accessing the account
using an ssh key.

```bash
# Expires instantly
sudo chage -E 0 username
su - username
# Password:
# Your account has expired; please contact your system administrator
# su: User account has expired

# Remove account expiration / Unlock account : Use -1 for -E
sudo chage -E -1 username
```

## usermod - modify a user account

Can be used to lock account by setting shell to /sbin/nologin

`-s SHELL_PATH` option lets you change the users default shell

Note: again, this will not prevent all actions from using ssh.
chage is still recommended to lock accounts.

```bash
sudo usermod -s /sbin/nologin jlocke
```

## cut - Gets specific part of an input

`-c RANGE` Cut lines by character

`-b RANGE` Cut lines by bytes (Ex: ASCII vs UTF8)

`-f RANGE` Cut lines by field (columns) (tab by default)

`-d DELIMITER` Specify the delimeter used for `-f`. Always quote DELIMITER.

`cut` cannot handle multi-character delimiters, use `awk`.

```bash
echo -e "Hello\nWorld\nHow\nAre\nYou" | cut -c 1
# H
# W
# H
# A
# Y

echo -e "Hello\nWorld\nHow\nAre\nYou" | cut -c 1-3
# Hel
# Wor
# How
# Are
# You

echo -e "Hello\nWorld\nHow\nAre\nYou" | cut -c 2-
# ello
# orld
# ow
# re
# ou

echo -e "Hello\nWorld\nHow\nAre\nYou" | cut -c -3
# Hel
# Wor
# How
# Are
# You

echo -e "Hello\nWorld\nHow Are\nAre\nYou Doing" | cut -c 1,3,5
# Hlo
# Wrd
# HwA
# Ae
# YuD

echo -e "Column1\tColumn2\tColumn3" | cut -f 1
# Column1
echo -e "Column1\tColumn2\tColumn3" | cut -f 2
# Column2
echo -e "Column1\tColumn2\tColumn3" | cut -f 3
# Column3

echo -e "Column1,Column2,Column3" | cut -d ',' -f 1
# Column1

echo -e "Column1,Column2,Column3" | cut -d ',' -f 1,2 --output-delimiter=':'
# Column1:Column2
```

## awk - Pattern scanning and processing language

Advantages of using awk:

- Allows delimiters of more than 1 character.
- Handles fields separated by whitespace well.

`-F SEPARATOR` Specify field separator

`-v OFS='SEPARATOR'` Change output field separator

`$NF` Special awk variable that gives number of fields.
Can be used to display last field.

```bash
echo -e "Column1DATA:Column2DATA:Column3" | awk -F 'DATA:' '{print $2}'
# Column2

echo -e 'Column1:Column2:Column3' | awk -F ':' '{print $1, $3}'
# Column1 Column3

echo -e 'Column1:Column2:Column3' | awk -F ':' -v OFS=',' '{print $1, $3}'
# Column1,Column3

echo -e 'Column1:Column2:Column3' | awk -F ':' -v OFS='=' '{print $1, $3}'
# Column1=Column3

echo -e 'Column1:Column2:Column3' | awk -F ':'  '{print $1 "," $3}'
# Column1,Column3

echo -e 'Column1:Column2:Column3' | awk -F ':'  '{print $1 ", " $3}'
# Column1, Column3

echo -e 'Value1:Value2:Value3' | awk -F ':'  '{print "COL1: " $1 " COL3:  " $3}'
# COL1: Value1 COL3:  Value3

echo -e 'Value1:Value2:Value3' | awk -F ':'  '{print $NF}'
# Value3

echo -e 'Value1:Value2:Value3' | awk -F ':'  '{print $(NF - 1)}'
# Value2

echo -e 'Value1:Value2:Value3' | awk -F ':'  '{print $(2 + 1)}'
# Value3

echo -e "L1C1         L2C2\n   L2C1 L2C2    \n L3C1      L3C2\nL4C1\tL4C2" | awk '{print $1, $2}'
# L1C1 L2C2
# L2C1 L2C2
# L3C1 L3C2
# L4C1 L4C2
```

## netstat - View open ports

`-n` Show numerical value of protocol port.

`-u` Get information on UDP.

`-t` Get information on TCP.

`-l` Get listening port.

`-4` Get only tcp v.4 lines. (Not v.6)

```bash
netstat -nutl
# Active Internet connections (only servers)
# Proto Recv-Q Send-Q Local Address           Foreign Address         State  
# tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
# tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN
# tcp6       0      0 :::22                   :::*                    LISTEN
# tcp6       0      0 ::1:25                  :::*                    LISTEN
# udp        0      0 0.0.0.0:55236           0.0.0.0:*
# udp        0      0 127.0.0.1:323           0.0.0.0:*
# udp        0      0 0.0.0.0:68              0.0.0.0:*
# udp6       0      0 :::48938                :::*
# udp6       0      0 ::1:323                 :::*

# Get just port numbers
netstat -nutl | grep -Ev "^Active|^Proto" | awk '{print $4}' | awk -F ':' '{print $NF}'
# 22
# 25
# 22
# 25
# 55236
# 323
# 68
# 48938
# 323
```

## sort - Sort content of a file alphabetically

Only sorts in output, sort is not stored in provided file.

`-r` To reverse order of output.

`-n` Numeric sort.

`-h` Human numeric sort (Understands K=kilobyte, M=megabyte,...)

`-u` Only keep unique values.

`-t` Specify field separator.

`-k` Specify a sort key.

```bash
echo -e "C\nB\nA" | sort
# A
# B
# C

echo -e "1\n2\n3" | sort -r
# 3
# 2
# 1

cut -d ':' -f 3 /etc/passwd | sort -n
# 0
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 11
# 12
# 14
# 29
# 32
# 74
# 81
# 89
# 99
# 192
# 997
# 998
# 999
# 1000
# 1001
# 1002
# 1005
# 65534

netstat -nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}' | sort -nu
# 22
# 25
# 68
# 323
# 48938
# 55236

echo -e "7:8:9\n4:5:6\n1:2:3" | sort -t ':' -k 3
# 1:2:3
# 4:5:6
# 7:8:9
```

## du - Disk usage info

```bash
du
# 8       ./.vagrant/rgloader
# 40      ./.vagrant/machines/default/virtualbox
# 44      ./.vagrant/machines/default
# 48      ./.vagrant/machines
# 60      ./.vagrant
# 8       ./Exercises/Exercise1
# 8       ./Exercises/Exercise5
# 8       ./Exercises/Exercise2
# 8       ./Exercises/Exercise4
# 8       ./Exercises/Exercise3
# 44      ./Exercises
# 164     .
```

## uniq - Removes duplicate lines

Note: Only works if the input to `uniq` is already sorted

`-c` Gives you the number of duplicate occurrences.

```bash
# Doesn't work on unsorted input
netstat -nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}' | uniq
# 22
# 25
# 22
# 25
# 55236
# 323
# 68
# 48938
# 323

netstat -nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}' | sort -n | uniq
# 22
# 25
# 68
# 323
# 48938
# 55236

netstat -nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}' | sort -n | uniq -c
#      2 22
#      2 25
#      1 68
#      2 323
#      1 48938
#      1 55236
```

## wc - Word count

Prints newline, word and byte counts for each file.

```bash
wc /etc/passwd
#   27   44 1307 /etc/passwd

wc -w /etc/passwd
#   44 /etc/passwd

wc -c /etc/passwd
#   1307 /etc/passwd

wc -l /etc/passwd
#   27 /etc/passwd
```

## /etc/hosts files is used to resolve hostnames into IP's

You can add entries to this file as if it is a local DNS.

```bash
cat /etc/hosts
# 127.0.0.1       admin01 admin01
# 127.0.0.1   localhost localhost.localdomain localhost4 # localhost4.localdomain4
# ::1         localhost localhost.localdomain localhost6 # localhost6.localdomain6
```

## tee - Read from STDIN and write to STDOUT and files

`-a` Append to a file

As compared to redirection `>>`, this allows you to append to files
that require elevated permissions.

```bash
echo "10.9.8.11 server01" | sudo tee -a /etc/hosts
10.9.8.11 server01
cat /etc/hosts
# 127.0.0.1       admin01 admin01
# 127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
# ::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# 10.9.8.11 server01
```

## ssh-keygen - Generate SSH key

```bash
ssh-keygen
# Generating public/private rsa key pair.
# Enter file in which to save the key (/home/vagrant/.ssh/id_rsa):
# Enter passphrase (empty for no passphrase):
# Enter same passphrase again:
# Your identification has been saved in /home/vagrant/.ssh/id_rsa.
# Your public key has been saved in /home/vagrant/.ssh/id_rsa.pub.
# The key fingerprint is:
# SHA256:f+mI1nLtP0y3kEpxRfO2EFL1N1LISk1OZU2rqtq7yjs vagrant@admin01
# The key's randomart image is:
# +---[RSA 2048]----+
# |           .===Oo|
# |           .+++.*|
# |          . .+.o=|
# |           o .+.+|
# |        S   o... |
# |         . ..+. .|
# |         .oo+o...|
# |      .E+.+=. o. |
# |       **B+.o... |
# +----[SHA256]-----+
```

## ssh-copy-id - Use local SSH key to login to remote machine

```bash
ssh-copy-id server01
# /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/vagrant/.ssh/id_rsa.pub"
# The authenticity of host 'server01 (10.9.8.11)' can't be established.
# ECDSA key fingerprint is SHA256:Fi4FisVgFyEkos9NgKz0q+zzZwe3+xhCHWGrXL+jZck.
# ECDSA key fingerprint is MD5:b6:04:55:d7:db:3c:a8:a1:b6:f6:15:1f:be:7e:48:41.
# Are you sure you want to continue connecting (yes/no)? yes
# /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
# /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
# vagrant@server01's password:
#
# Number of key(s) added: 1
#
# Now try logging into the machine, with:   "ssh 'server01'"
# and check to make sure that only the key(s) you wanted were added.


[vagrant@admin01 ~]$ ssh server01
[vagrant@server01 ~]$ # <=== Notice the change in hostname
```

## Remotely execute commands on other machine using SSH

```bash
[vagrant@admin01 ~]$ ssh server01 hostname
server01
```
