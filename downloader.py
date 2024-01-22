import argparse
from yt_dlp import YoutubeDL

def download_video(id, output_path, file_name):
  #print(resolution)
  options = {
    'format': f'best[height=360]+bestaudio[ext=m4a]/best[ext=mp4]/best',
    'outtmpl': f'{output_path}/{file_name}.%(ext)s',
  }

  with YoutubeDL(options) as ydl:
    result = ydl.download([f'https://www.youtube.com/watch?v={id}'])
  return("失敗")

if __name__ == "__main__":
  parser = argparse.ArgumentParser(description="YouTube video downloader")
  parser.add_argument("id", help="YouTube video URL")
  parser.add_argument("-o", "--output", help="Output directory path", default=".")
  parser.add_argument("-f", "--filename", help="Output filename (without extension)", default="video")

  args = parser.parse_args()
  try:
    download_video(args.id, args.output, args.filename)
  except:
    print("失敗")