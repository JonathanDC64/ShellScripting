# Shell scripting

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

## Define variable

There must not be any spaces next to the =

Variable names can contain [a-z], [A-Z], [0-9] and _

Cannot start with digits [0-9]

```bash
WORD='script'
readonly VERBOSE='true' # Cannot be modified after value is assigned
```

## Output value of variable

Conventionally, variables are upper case.

In general, single quotes ' ' prevent the expansion of variables.

Use double quots " " to expand variables.

Use the `"${WORD}"`to append text to a variable

```bash
echo "$WORD"
# script

echo "This is a shell ${WORD}"
# This is a shell script

echo "${WORD}ing is fun!"
# scripting is fun!
```

## Store output of command in variable

```bash
USER_NAME=$(id -un)
USER_NAME=`id -un`
```

## Builting variables

```bash
# The current users UID
echo "${UID}"
# 1000
echo "${EUID}"
# 1000

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

```bash
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

# Elif
# if [[ "${1}" = 'start' ]]
# then
#     echo 'tarting'
# elif [[ "${1}" = 'stop' ]]
# then
#     echo 'Stoping'
# elif [[ "${1}" = 'status' ]]
# then
#     echo 'Status:'
# else
#     echo 'Supply a valid option.'
#     exit 1
# fi

#arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne, -lt, -le, -gt, or -ge.
```

## Get exit status of last command

Use `${?}` builtin.

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

Convetionally, usernames are limitted to 8 characters
and all lowercase.

Having more than 8 characters does not create
many problems though.

The `-m` flag creates a home directory for the user.

The `-c` flag attaches a comment to the user.

```bash
usseradd -c "${COMMENT}" -m "${USER_NAME}"
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

## shuf - Generate random permuattions

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

## Positional paramaters and Special Parameters

```bash
# First parameter is the path used for the script
echo "You executed this command ${0}"
# You executed this command ./luser-demo06.sh

# if you use the fullpath it changes
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

# You can also do multiple redirections at once
head -n1 /etc/passwd /etc/hosts /fakefile 1> head_output.log 2> error.log

# Redirect both statndard output and error to the same file
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
        echo 'Stoping.'
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

Since these do not prevent users from accessing the acount
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
