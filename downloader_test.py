from yt_dlp import YoutubeDL

options = {
  'format':'best[height=360]',
  'outtmpl': 'public/sample3.%(ext)s',
}

with YoutubeDL(options) as ydl:
  result = ydl.download([
    'https://www.youtube.com/watch?v=wLsBkickVo8',
  ])