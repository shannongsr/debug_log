# -*- coding:utf-8 -*-
import uuid
import os
import sys
mac = uuid.UUID(  int=uuid.getnode() ).hex[-12:]
while(mac == '0242alafd239'):
    os.system("./video_camera1_dehaze")
print(mac)
sys.exit()
