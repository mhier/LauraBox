#!/usr/bin/python3

import sys
from ytmusicapi import YTMusic
import os

# Note: You must export your google cookies into ~/Downloads/cookies.txt first (Netscape cookie format, e.g. with Export
# cookies Firefox plugin)!

# Add playlist ID to download. Can be extracted from the URL: https://music.youtube.com/playlist?list=<PlaylistID>
if len(sys.argv) != 2 :
  print("Playlist ID missing!")
  sys.exit(1)

PlaylistID=sys.argv[1]
print("Playlist ID: "+PlaylistID)

api = YTMusic(os.path.dirname(__file__)+"/headers_auth.json")

l = api.get_playlist(PlaylistID)

counter = 0
for track in l["tracks"] :
  videoId = track["videoId"]
  
  title = track["title"]
  safetitle="".join([c for c in title if c.isalnum() or c==' ']).rstrip()
  counter = counter+1
  filename = "%03d" % counter + " - " + safetitle + ".mp3"
  
  print(filename)
  if os.path.exists(filename):
    print("already exists...")
    continue
  
  os.system("rm -f tempdownload.*")
  os.system("youtube-dl https://music.youtube.com/watch?v="+videoId+" -o tempdownload --cookies=~/Downloads/cookies.txt")
  os.system("ffmpeg -i tempdownload.* -vn -b:a 192K '"+filename+"'")

