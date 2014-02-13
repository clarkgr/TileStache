import os
import sys
cd = os.path.dirname(os.path.realpath(__file__))
sys.path.append(cd)
sys.path.append(cd + '/../cascadenik')
import cascadenik
import TileStache
from TileStache import Goodies
from TileStache.Goodies import ExternalConfigServer

#application = TileStache.WSGITileServer(cd + '/tilestache.cfg', False)
application = ExternalConfigServer.WSGIServer("http://localhost/config/tileserver")

