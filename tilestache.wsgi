import os
import sys
cd = os.path.dirname(os.path.realpath(__file__))
sys.path.append(cd)
print sys.path
import TileStache

application = TileStache.WSGITileServer(cd + 'tilestache.cfg', False)
