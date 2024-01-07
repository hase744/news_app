from yt_dlp import YoutubeDL

options = {
  'outtmpl': 'public/sample.%(ext)s',
}

with YoutubeDL(options) as ydl:
  result = ydl.download([
    'https://www.youtube.com/watch?v=gvdf5n-zI14',
  ])