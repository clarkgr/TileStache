import os
import sys
sys.path.append('/projects/tilestache')
import TileStache

application = TileStache.WSGITileServer('/projects/tilestache/tilestache.cfg', False)
