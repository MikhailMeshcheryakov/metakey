metakey
=======

Utility to make metakey open Kickoff menu in KDE

metakey is a little program for runs in the background as a daemon. It
was redone from xcape by Albin Olsson: https://github.com/alols/xcape

------------
Installation
------------
1. Use this command:

    $ sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
    $ mkdir metakey
    $ cd metakey
    $ git clone https://github.com/MikhailMeshcheryakov/metakey.git .
    $ make
    
2. Launch metakey. Set Alt+Ctrl on left side of your keyboard to open Kickoff menu.

Usage
-----
    $ metakey [-d] [-t <timeout ms>] [-e <map-expression>]

`-d`

Debug mode. Does not fork into the background.

`-t <timeout ms>`

If you hold a key longer than this timeout, metakey will not generate a key
event. Default is 50 ms.

`-e <map-expression>`

The expression has the grammar `'ModKey=Key[|OtherKey][;NextExpression]'`

All keynames you can found in the head `X11/keysymdef.h`
(remove the `XK_` prefix).

Alternatively, you can specify ModKey in decimal (prefix `#`), octal (`#0`), or
hexadecimal (`#0x`). It will be interpreted as a keycode unless no corresponding
key name is found.


Note regarding xmodmap
----------------------

If you are in the habit of remapping keycodes to keysyms (e.g. using xmodmap),
there are two issues you may encounter:

1) You will need to restart metakey after every time you modify the mapping 
   from keycodes to keysyms (e.g. with xmodmap), or metakey will still use 
   the old mapping.
   
2) The key you wish to send must have a defined keycode. So for example, with
   `Alt_L=Escape`, you need an Escape key defined in your xmodmap mapping. 
   (A workaround is to use 255, which some keyboards cannot send.)

Contact
-------

Find the latest version at
https://github.com/MikhailMeshcheryakov/metakey

The author can be reached at
mikhail dot meshcheryakov at effits dot ru
