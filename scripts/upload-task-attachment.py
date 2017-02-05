import os
import re
import time
import tkFileDialog
import tkSimpleDialog

from shutil import copy2


TASK_ATTACHMENT_FOLDER ="~/doc/Management/Aufgaben/Anlagen"
TASK_ATTACHMENT_FOLDER = os.path.expanduser(TASK_ATTACHMENT_FOLDER)

file_name = tkFileDialog.askopenfilename(initialdir="~/doc")
file_name = os.path.expanduser(file_name)
simple_file_name = re.sub(".*/","", file_name)

now = time.strftime("%Y-%m-%d_%H-%M-%S")
copy_file_name = TASK_ATTACHMENT_FOLDER + "/" + now + "_" + simple_file_name
copy2(file_name, copy_file_name)

print "\"" + copy_file_name + "\""



