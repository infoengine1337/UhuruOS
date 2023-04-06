import pkg_resources
import os.path
import os

# Code to detect filename
def detect_filename(filename):
	if os.path.isfile(filename):
		return filename
	else:
		return pkg_resources.resource_filename(__name__, filename)
