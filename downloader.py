import argparse
from yt_dlp import YoutubeDL

def download_video(id, output_path, file_name):
  options = {
    'format': 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4',
    'outtmpl': f'{output_path}/{file_name}.%(ext)s',
  }

  with YoutubeDL(options) as ydl:
    result = ydl.download([f'https://www.youtube.com/watch?v={id}'])

if __name__ == "__main__":
  parser = argparse.ArgumentParser(description="YouTube video downloader")
  parser.add_argument("id", help="YouTube video URL")
  parser.add_argument("-o", "--output", help="Output directory path", default=".")
  parser.add_argument("-f", "--filename", help="Output filename (without extension)", default="video")

  args = parser.parse_args()

  download_video(args.id, args.output, args.filename)
  status = download_video(args.id, args.output, args.filename)
  print(f"Download status: {status}")