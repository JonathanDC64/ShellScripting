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
