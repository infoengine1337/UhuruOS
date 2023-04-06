import os
from PyQt5.QtWidgets import QMessageBox

def startTor(parent, config_dict):

	torrc_path = "/etc/tor/torrc"

	eliminated_directive = ["UseBridges", "ClientTransportPlugin", "ClientTransportPlugin", "bridge", "Bridge", "HTTPSProxy", "HTTPSProxyAuthenticator", "Socks4Proxy", "Socks5Proxy", "Socks5ProxyUsername", "Socks5ProxyPassword"]

	try:

		if os.path.exists(torrc_path) and os.path.isfile(torrc_path):
				
			with open(torrc_path, "r") as f:
				torrc_textlist = f.read().splitlines()

			mod_torrc_textlist = [tmp for tmp in torrc_textlist if all(map(lambda x: not tmp.startswith(x) , eliminated_directive))]

			mod_torrc_textlist += (config_dict["bridges_list"] + config_dict["proxies_list"])

			with open(torrc_path, "w") as f:
				f.write("\n".join(mod_torrc_textlist))

			command = "systemctl restart tor"
			os.system(command)

		else:
			QMessageBox.critical(parent, "Error", "torrc file does not exist.")

	except Exception as e: # Output error if one is encountered
		QMessageBox.critical(parent, "Error", "an error happened {}.".format(e))


def stopTor():
	# Stop Tor if it is an option in the process descriptor
	command = "systemctl stop tor"
	os.system(command)
